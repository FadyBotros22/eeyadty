import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoadingMinimumAppVersion,
    String? minimumAcceptedVersion,
    String? currentStoreVersion,
    String? message,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
}
