part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserFetchRequested extends UserEvent {
  final int page;

  const UserFetchRequested({required this.page});

  @override
  List<Object> get props => [page];
}

