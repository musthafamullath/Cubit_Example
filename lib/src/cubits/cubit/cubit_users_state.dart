part of 'cubit_users_cubit.dart';

class CubitUsersState {}

class CubitUsersLoading extends CubitUsersState {}

class CubitUsersLoaded extends CubitUsersState {
  List<UsersModel> users;

  CubitUsersLoaded({required this.users});
}
