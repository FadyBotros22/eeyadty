import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_info.freezed.dart';
part 'page_info.g.dart';

@freezed
abstract class PageInfo with _$PageInfo {
  const factory PageInfo({
    int? currentPage,
    int? pagesCount,
    int? nextPage,
    int? perPage,
    int? recordsCount,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
}
