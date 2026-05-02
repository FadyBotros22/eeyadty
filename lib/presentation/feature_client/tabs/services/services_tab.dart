import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/models/service/service.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../../widgets/app_widgets.dart';
import 'bloc/services_bloc.dart';
import 'bloc/services_event.dart';
import 'bloc/services_state.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<ServicesBloc>();
    bloc.add(const ServicesEvent.loadCategories());
    bloc.add(const ServicesEvent.loadServices());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildHeader(context, state),
                ),
                if (state.isLoadingServices)
                  const SliverFillRemaining(
                    child: AppLoadingWidget(),
                  )
                else if (state.errorMessage != null)
                  SliverFillRemaining(
                    child: AppErrorWidget(
                      message: state.errorMessage!,
                      onRetry: () => context
                          .read<ServicesBloc>()
                          .add(const ServicesEvent.loadServices()),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingMD,
                    ),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (_, i) => _ServiceCard(
                            service: state.filteredServices[i]),
                        childCount: state.filteredServices.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.82,
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, ServicesState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimens.paddingMD,
        AppDimens.paddingMD,
        AppDimens.paddingMD,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our Services', style: AppTextStyles.h2),
          const SizedBox(height: 4),
          Text(
            'Browse and book from our clinic services',
            style:
                AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          // Search
          TextField(
            controller: _searchCtrl,
            onChanged: (q) => context
                .read<ServicesBloc>()
                .add(ServicesEvent.searchServices(q)),
            decoration: InputDecoration(
              hintText: 'Search services...',
              hintStyle:
                  AppTextStyles.body.copyWith(color: AppColors.textHint),
              prefixIcon: const Icon(Icons.search,
                  color: AppColors.textSecondary),
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.radiusFull),
                borderSide: const BorderSide(color: AppColors.inputBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.radiusFull),
                borderSide: const BorderSide(color: AppColors.inputBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.radiusFull),
                borderSide: const BorderSide(
                    color: AppColors.primary, width: 1.5),
              ),
            ),
          ),
          // Categories
          if (state.categories.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  if (i == 0) {
                    final isAll = state.selectedCategoryId == null;
                    return _CategoryChip(
                      label: 'All',
                      isSelected: isAll,
                      onTap: () => context.read<ServicesBloc>().add(
                          const ServicesEvent.selectCategory(null)),
                    );
                  }
                  final cat = state.categories[i - 1];
                  final isSelected =
                      state.selectedCategoryId == cat.id;
                  return _CategoryChip(
                    label: cat.name ?? '',
                    isSelected: isSelected,
                    onTap: () => context
                        .read<ServicesBloc>()
                        .add(ServicesEvent.selectCategory(cat.id)),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusFull),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.inputBorder,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ClinicService service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: service.imageUrl != null
                ? Image.network(
                    service.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholder(),
                  )
                : _placeholder(),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name ?? '',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (service.durationMinutes != null)
                  Text(
                    '${service.durationMinutes} min',
                    style: AppTextStyles.bodySmall,
                  ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (service.price != null)
                      Text(
                        'EGP ${service.price!.toStringAsFixed(0)}',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(AppDimens.radiusSM),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.primary.withOpacity(0.08),
      child: const Center(
        child: Icon(
          Icons.medical_services_rounded,
          color: AppColors.primary,
          size: 40,
        ),
      ),
    );
  }
}
