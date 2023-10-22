import 'package:demo_users/database/database_helper.dart';

import '../models/userModel.model.dart';

class UserDao {
  final database = DatabaseHelper.instance.db;

  Future<List<UserModel>> readAll() async {
    final data = await database.query('users');
    return data.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> insert(UserModel user) async {
    return await database.insert('users', {
      'name': user.name,
      'lastname': user.lastname,
      'birthdate': user.birthdate,
      'address': user.address,
    });
  }
}
