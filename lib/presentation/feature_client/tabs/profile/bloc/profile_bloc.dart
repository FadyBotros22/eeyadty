import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../../../../../domain/repositories/profile_repository.dart';
import '../../../../../domain/models/user/client_user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileState.initial()) {
    on<LoadProfile>(_onLoad);
    on<UpdateProfile>(_onUpdate);
    on<UploadAvatar>(_onUploadAvatar);
  }

  FutureOr<void> _onLoad(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _profileRepository.getProfile(event.userId);
    print('${result.data}');
    if (result.isSuccess) {
      emit(state.copyWith(isLoading: false, user: result.data));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onUpdate(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isUpdating: true, updateSuccess: false));
    final updated = (state.user ?? const ClientUser()).copyWith(
      id: event.userId,
      fullName: event.fullName ?? state.user?.fullName,
      phoneNumber: event.phoneNumber ?? state.user?.phoneNumber,
      dateOfBirth: event.dateOfBirth ?? state.user?.dateOfBirth,
      gender: event.gender ?? state.user?.gender,
    );
    final result = await _profileRepository.updateProfile(updated);
    if (result.isSuccess) {
      emit(state.copyWith(
          isUpdating: false, user: result.data, updateSuccess: true));
    } else {
      emit(state.copyWith(isUpdating: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onUploadAvatar(
      UploadAvatar event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isUpdating: true));
    final urlResult = await _profileRepository.uploadAvatar(
        userId: event.userId , file: event.file);
    if (urlResult.isSuccess) {
      final updated =
          (state.user ?? const ClientUser()).copyWith(avatarUrl: urlResult.data);
      final saveResult = await _profileRepository.updateProfile(updated);
      if (saveResult.isSuccess) {
        emit(state.copyWith(isUpdating: false, user: saveResult.data));
      } else {
        emit(state.copyWith(isUpdating: false, errorMessage: saveResult.error));
      }
    } else {
      emit(state.copyWith(isUpdating: false, errorMessage: urlResult.error));
    }
  }
}
