import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'failure_bloc.freezed.dart';
part 'failure_event_state.dart';

class FailureBloc extends Bloc<FailureEvent, FailureState> {
  FailureBloc() : super(FailureState.initial()) {
    on<ShowFailure>(showFailure);
    on<FailureShown>(resetFailure);
  }

  FutureOr<void> showFailure(ShowFailure event, Emitter<FailureState> emit) {
    log(event.failure.toString());
    emit(state.copyWith(failure: event.failure));

    add(const FailureEvent.failureShown());
  }

  FutureOr<void> resetFailure(FailureShown event, Emitter<FailureState> emit) {
    emit(FailureState.initial());
  }
}
