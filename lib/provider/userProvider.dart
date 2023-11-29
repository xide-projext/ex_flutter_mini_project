import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';

final userProvider = FutureProvider.autoDispose((ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.http('localhost:3000', '/users/1'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  print(json);
  print('--User.fromJson--');
  print(User.fromJson(json));
  // Finally, we convert the Map into an Activity instance.
  return User.fromJson(json);
});