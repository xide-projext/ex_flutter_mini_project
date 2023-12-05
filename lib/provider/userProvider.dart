import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '/model/user.dart';

class AsyncUsersNotifier extends AsyncNotifier<List<dynamic>> {
  Future<List<dynamic>> _fetchUsers() async {
    final response = await http.get(Uri.http('localhost:3000', '/users'));
    print(response.body);
    final users = jsonDecode(response.body);
    return users.map(User.fromJson).toList();
  }

  @override
  Future<List<dynamic>> build() async {
    // Load initial todo list from the remote repository
    return _fetchUsers();
  }
}

final asyncUsersProvider =
    AsyncNotifierProvider<AsyncUsersNotifier, List<dynamic>>(() {
  return AsyncUsersNotifier();
});
