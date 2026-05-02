import 'dart:async';

import 'package:beautisry_merchant/presentation/feature_home/bloc/home_event.dart';
import 'package:beautisry_merchant/presentation/feature_home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/network/failure/failure_bloc.dart';
import '../../../domain/repositories/auth_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepository _authRepository;
  final FailureBloc _failureBloc;

  HomeBloc(this._authRepository, this._failureBloc)
      : super(HomeState.initial()) {
    on<GetMinimumAppVersion>(getMinimumAppVersion);
  }

  FutureOr<void> getMinimumAppVersion(
      GetMinimumAppVersion event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingMinimumAppVersion: true));

    var result = await _authRepository.getMinimumAppVersion();

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isLoadingMinimumAppVersion: false,
          minimumAcceptedVersion: result.data?.minimumAcceptedVersion,
          currentStoreVersion: result.data?.currentStoreVersion,
          message: result.data?.message,
        ),
      );
    } else {
      emit(state.copyWith(
          isLoadingMinimumAppVersion: false,
          minimumAcceptedVersion: null,
          currentStoreVersion: null));
      _failureBloc.add(FailureEvent.showFailure(result.error!));
    }
  }
}
