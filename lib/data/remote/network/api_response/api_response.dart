import 'package:freezed_annotation/freezed_annotation.dart';

import 'meta.dart';

part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({required Meta meta, T? data}) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
      Map<String, dynamic>? json,
      T Function(Object? json) fromJsonT,
      ) {
    final jsonMap = json ?? {};

    // Handle the case where data is an empty map or null
    final dataJson = jsonMap['data'];
    T? data;

    if (dataJson != null && dataJson is Map && dataJson.isNotEmpty) {
      data = fromJsonT(dataJson);
    } else if (dataJson != null && dataJson is! Map) {
      // Handle cases where data is not a Map (e.g., primitive types, lists)
      data = fromJsonT(dataJson);
    }
    // If dataJson is null or an empty map, data remains null

    return ApiResponse<T>(
      meta: Meta.fromJson(jsonMap['meta'] as Map<String, dynamic>? ?? {}),
      data: data,
    );
    // Note: 'errors' field from API response is intentionally ignored
  }
}
