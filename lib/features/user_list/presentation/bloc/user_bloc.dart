import 'package:bloc/bloc.dart';
import 'package:demo_poc_bloc/features/user_list/data/models/user_model.dart';
import 'package:demo_poc_bloc/features/user_list/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserFetchRequested>(
      (event, emit) async {
        emit(UserLoading());
        try {
          final users = await userRepository.getUsers(event.page);
          emit(UserLoaded(users: users));
        } catch (_) {
          emit(const UserError('Failed to load users'));
        }
      },
    );
  }
}
