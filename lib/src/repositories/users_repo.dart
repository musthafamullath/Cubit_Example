import 'package:crud_cubit/src/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UsersRepo {
static const usersUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<List<UsersModel>> getUsers() async {
    Response response = await http.get(Uri.parse(usersUrl));
    print("📲📲📲📲📲 ${response.statusCode}");
    print("📲📲📲📲📲 ${response.body}");
    return usersModelFromJson(response.body);
  }
}
