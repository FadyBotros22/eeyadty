import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../data/preferences/user_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserPreferences _userPreferences;

  AuthBloc(this._authRepository, this._userPreferences)
      : super(AuthState.initial()) {
    on<AuthSignIn>(_onSignIn);
    on<AuthSignUp>(_onSignUp);
    on<AuthSignOut>(_onSignOut);
  }

  FutureOr<void> _onSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    final result = await _authRepository.signIn(
      email: event.email,
      password: event.password,
      role: event.role,
    );
    if (result.isSuccess) {
      final user = result.data!;
      _userPreferences.currentUser = user;
      _userPreferences.isUserRegistered = true;
      _userPreferences.isFirstLaunch = false;
      emit(state.copyWith(isLoading: false, user: user, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    final result = await _authRepository.signUp(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
      phoneNumber: event.phoneNumber,
      role: event.role,
      // Doctor-only — null for patients
      specialty: event.specialty,
      bio: event.bio,
      consultationPrice: event.consultationPrice,
    );
    if (result.isSuccess) {
      final user = result.data!;
      _userPreferences.currentUser = user;
      _userPreferences.isUserRegistered = true;
      _userPreferences.isFirstLaunch = false;
      emit(state.copyWith(isLoading: false, user: user, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onSignOut(AuthSignOut event, Emitter<AuthState> emit) async {
    await _authRepository.signOut();
    _userPreferences.logout();
    emit(AuthState.initial());
  }
}
