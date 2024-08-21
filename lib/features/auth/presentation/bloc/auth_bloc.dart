import 'package:bloc/bloc.dart';
import 'package:demo_poc_bloc/features/auth/data/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthRegisterRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final token =
              await authRepository.registerUser(event.email, event.password);
          emit(AuthAuthenticated(token: token));
        } catch (e) {
          emit(AuthError('Authentication Failed: ${e.toString()}'));
        }
      },
    );

    on<AuthLoginRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final token =
              await authRepository.loginUser(event.email, event.password);
          emit(AuthAuthenticated(token: token));
        } catch (e) {
          emit(AuthError('Registration Failed: ${e.toString()}'));
        }
      },
    );
  }
}
