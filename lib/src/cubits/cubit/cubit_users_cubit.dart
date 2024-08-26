import 'package:bloc/bloc.dart';
import 'package:crud_cubit/src/models/users_model.dart';
import 'package:crud_cubit/src/repositories/users_repo.dart';

part 'cubit_users_state.dart';
class CubitUsersCubit extends Cubit<CubitUsersState> {
  final UsersRepo usersRepo = UsersRepo();
  
  CubitUsersCubit() : super(CubitUsersLoading()) {
    getData();
  }

  Future<void> getData() async {
    print("👍🏽👍🏽👍🏽👍🏽👍🏽${usersRepo.getUsers()}");
    try {
      List<UsersModel> users = await usersRepo.getUsers();
      print('🖥️🖥️🖥️🖥️ ${users.length}');
      print('🖥️🖥️🖥️🖥️ ${users.isEmpty}');
      emit(CubitUsersLoaded(users: users));
    } catch (e) {
      emit(CubitUsersError("Failed to fetch users"));
    }
  }
}
final class CubitUsersError extends CubitUsersState {
  final String message;

  CubitUsersError(this.message);
}
