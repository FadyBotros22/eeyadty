part of 'failure_bloc.dart';

@freezed
class FailureEvent with _$FailureEvent {
  const factory FailureEvent.showFailure(Failure failure) = ShowFailure;
  const factory FailureEvent.failureShown() = FailureShown;
}

@freezed
abstract class FailureState with _$FailureState {
  const FailureState._();

  factory FailureState({
    Failure? failure,
  }) = _FailureState;

  factory FailureState.initial() => FailureState(failure: null);
}
