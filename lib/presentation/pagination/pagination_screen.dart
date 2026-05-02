import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/models/page_info/page_info.dart';

const pageSize = 20;
const initialPage = 1;
/// Builder function for list items
typedef ItemBuilder<T> = Widget Function(BuildContext context, T item, int index);

/// Builder function for empty state
typedef EmptyBuilder = Widget Function(BuildContext context);

/// Builder function for loading indicators
typedef LoadingBuilder = Widget Function(BuildContext context);

/// Adapter function that extracts items from any state type
typedef ItemExtractor<T, S> = List<T> Function(S state);

/// Adapter function that extracts loading state from any state type
typedef LoadingExtractor<S> = bool Function(S state);

/// Adapter function that extracts page info from any state type
typedef PageInfoExtractor<S> = PageInfo? Function(S state);

/// Adapter function that extracts error from any state type
typedef ErrorExtractor<S> = Object? Function(S state);

/// Function to update an item at a specific index
typedef ItemUpdater<T> = T Function(T oldItem);

/// Key extractor for identifying items (optional, falls back to index)
typedef ItemKeyExtractor<T> = Object? Function(T item);


/// A reusable paginated list view that works with ANY state class
/// No need to implement interfaces or change your BLoC!
class PaginatedListView<T, B extends BlocBase<S>, S> extends StatefulWidget {
  final B bloc;
  final void Function(int page, int perPage) onFetchPage;

  // Adapter functions - map your state to pagination needs
  final ItemExtractor<T, S> itemExtractor;
  final LoadingExtractor<S> loadingExtractor;
  final PageInfoExtractor<S> pageInfoExtractor;
  final ErrorExtractor<S>? errorExtractor;

  final ItemBuilder<T> itemBuilder;
  final EmptyBuilder emptyBuilder;
  final LoadingBuilder? firstPageLoadingBuilder;
  final LoadingBuilder? newPageLoadingBuilder;
  final WidgetBuilder? errorBuilder;
  final EdgeInsetsGeometry? padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final Widget? header;
  final Widget? footer;
  final Future<void> Function()? onRefresh;

  // Optional key extractor for stable item identification
  final ItemKeyExtractor<T>? itemKeyExtractor;

  const PaginatedListView({
    super.key,
    required this.bloc,
    required this.onFetchPage,
    required this.itemExtractor,
    required this.loadingExtractor,
    required this.pageInfoExtractor,
    this.errorExtractor,
    required this.itemBuilder,
    required this.emptyBuilder,
    this.firstPageLoadingBuilder,
    this.newPageLoadingBuilder,
    this.errorBuilder,
    this.padding,
    this.separatorBuilder,
    this.shrinkWrap = false,
    this.physics,
    this.scrollController,
    this.header,
    this.footer,
    this.onRefresh,
    this.itemKeyExtractor,
  });

  @override
  State<PaginatedListView<T, B, S>> createState() =>
      PaginatedListViewState<T, B, S>();
}

class PaginatedListViewState<T, B extends BlocBase<S>, S>
    extends State<PaginatedListView<T, B, S>> {
  late final PagingController<int, T> _pagingController;
  StreamSubscription<S>? _blocSubscription;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController<int, T>(
      getNextPageKey: _getNextPageKey,
      fetchPage: _fetchPage,
    );
  }

  int? _getNextPageKey(PagingState<int, T> state) {
    if (state.pages?.isNotEmpty == true) {
      final lastPage = state.pages?.last;
      if ((lastPage?.length ?? 0) < pageSize) {
        return null;
      }
    }
    return (state.keys?.last ?? initialPage - 1) + 1;
  }

  Future<List<T>> _fetchPage(int pageKey) async {
    final completer = Completer<List<T>>();

    widget.onFetchPage(pageKey, pageSize);

    _blocSubscription?.cancel();
    _blocSubscription = widget.bloc.stream.listen((state) {
      final isLoading = widget.loadingExtractor(state);
      final PageInfo? pageInfo = widget.pageInfoExtractor(state);
      final error = widget.errorExtractor?.call(state);

      if (!isLoading && pageInfo != null) {
        if (pageInfo.currentPage == pageKey) {
          _blocSubscription?.cancel();
          completer.complete(widget.itemExtractor(state));
        }
      }

      if (error != null) {
        _blocSubscription?.cancel();
        completer.completeError(error);
      }
    });

    return completer.future;
  }

  @override
  void dispose() {
    _blocSubscription?.cancel();
    _pagingController.dispose();
    super.dispose();
  }

  void _refresh() {
    _pagingController.refresh();
  }

  void updateItemAtIndex(int index, ItemUpdater<T> updater) {
    final currentState = _pagingController.value;
    if (currentState.pages == null) return;

    int remainingIndex = index;
    List<List<T>> newPages = [];
    int? targetPageIndex;
    int? targetLocalIndex;

    for (int i = 0; i < currentState.pages!.length; i++) {
      final page = currentState.pages![i];
      if (remainingIndex < page.length) {
        targetPageIndex = i;
        targetLocalIndex = remainingIndex;
        break;
      }
      remainingIndex -= page.length;
    }

    if (targetPageIndex == null || targetLocalIndex == null) return;

    for (int i = 0; i < currentState.pages!.length; i++) {
      if (i == targetPageIndex) {
        final newPage = List<T>.from(currentState.pages![i]);
        newPage[targetLocalIndex] = updater(newPage[targetLocalIndex]);
        newPages.add(newPage);
      } else {
        newPages.add(List<T>.from(currentState.pages![i]));
      }
    }

    _pagingController.value = currentState.copyWith(
      pages: newPages,
    );
  }

  void updateItemWhere(bool Function(T item) predicate, ItemUpdater<T> updater) {
    final currentState = _pagingController.value;
    if (currentState.pages == null) return;

    List<List<T>> newPages = [];
    bool found = false;

    for (final page in currentState.pages!) {
      final newPage = <T>[];
      for (final item in page) {
        if (!found && predicate(item)) {
          newPage.add(updater(item));
          found = true;
        } else {
          newPage.add(item);
        }
      }
      newPages.add(newPage);
    }

    if (found) {
      _pagingController.value = currentState.copyWith(
        pages: newPages,
      );
    }
  }

  void updateItemByKey(Object key, ItemUpdater<T> updater) {
    assert(widget.itemKeyExtractor != null,
    'itemKeyExtractor must be provided to use updateItemByKey');

    updateItemWhere(
          (item) => widget.itemKeyExtractor!(item) == key,
      updater,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      bloc: widget.bloc,
      listenWhen: (previous, current) {
        final prevError = widget.errorExtractor?.call(previous);
        final currError = widget.errorExtractor?.call(current);
        return currError != null && currError != prevError;
      },
      listener: (context, state) {
        final error = widget.errorExtractor?.call(state);
        if (error != null) {
          _pagingController.value = _pagingController.value.copyWith(
            error: error,
          );
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          if (widget.onRefresh != null) {
            await widget.onRefresh!();
          } else {
            _refresh();
          }
        },
        child: PagingListener(
          controller: _pagingController,
          builder: (context, pagingState, fetchNextPage) {
            Widget listView;

            final builderDelegate = PagedChildBuilderDelegate<T>(
              itemBuilder: widget.itemBuilder,
              noItemsFoundIndicatorBuilder: widget.emptyBuilder,
              firstPageProgressIndicatorBuilder: widget.firstPageLoadingBuilder ??
                      (_) => const Center(child: CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: widget.newPageLoadingBuilder ??
                      (_) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
              newPageErrorIndicatorBuilder: widget.errorBuilder ??
                      (context) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Error loading more items'),
                    ),
                  ),
            );

            if (widget.separatorBuilder != null) {
              listView = PagedListView<int, T>.separated(
                state: pagingState,
                fetchNextPage: fetchNextPage,
                padding: widget.padding,
                shrinkWrap: widget.shrinkWrap,
                physics: widget.physics,
                scrollController: widget.scrollController,
                builderDelegate: builderDelegate,
                separatorBuilder: widget.separatorBuilder!,
              );
            } else {
              listView = PagedListView<int, T>(
                state: pagingState,
                fetchNextPage: fetchNextPage,
                padding: widget.padding,
                shrinkWrap: widget.shrinkWrap,
                physics: widget.physics,
                scrollController: widget.scrollController,
                builderDelegate: builderDelegate,
              );
            }

            if (widget.header != null || widget.footer != null) {
              return CustomScrollView(
                physics: widget.physics,
                controller: widget.scrollController,
                slivers: [
                  if (widget.header != null)
                    SliverToBoxAdapter(child: widget.header!),
                  SliverToBoxAdapter(child: listView),
                  if (widget.footer != null)
                    SliverToBoxAdapter(child: widget.footer!),
                ],
              );
            }

            return listView;
          },
        ),
      ),
    );
  }
}

extension PaginatedListViewExtension<T, B extends BlocBase<S>, S>
on GlobalKey<PaginatedListViewState<T, B, S>> {
  void updateItemAtIndex(int index, ItemUpdater<T> updater) {
    currentState?.updateItemAtIndex(index, updater);
  }

  void updateItemWhere(bool Function(T item) predicate, ItemUpdater<T> updater) {
    currentState?.updateItemWhere(predicate, updater);
  }

  void updateItemByKey(Object key, ItemUpdater<T> updater) {
    currentState?.updateItemByKey(key, updater);
  }

  void refresh() {
    currentState?._refresh();
  }
}