import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '/model/user.dart';

class AsyncUsersNotifier extends AsyncNotifier<List<User>> {
  Future<List<User>> _fetchUsers() async {
    final response = await http.get(Uri.http('localhost:3000', '/users'));
    final usersJson = jsonDecode(response.body) as List;
    final users = usersJson.map((userJson) => User.fromJson(userJson as Map<String, dynamic>)).toList();
    return users;
  }

  @override
  Future<List<User>> build() async {
    // Load initial todo list from the remote repository
    return _fetchUsers();
  }
}

final asyncUsersProvider =
    AsyncNotifierProvider<AsyncUsersNotifier, List<User>>(() {
  return AsyncUsersNotifier();
});