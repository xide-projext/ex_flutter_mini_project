import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '/models/match.dart';

class AsyncMatchsNotifier extends AsyncNotifier<List<Match>> {
  Future<List<Match>> _fetchMatchs() async {
    final response = await http.get(Uri.http('localhost:3000', '/matchs'));
    final matchsJson = jsonDecode(response.body) as List;
    final matchs = matchsJson
        .map((matchJson) => Match.fromJson(matchJson as Map<String, dynamic>))
        .toList();
    return matchs;
  }

  @override
  Future<List<Match>> build() async {
    // Load initial match list from the remote repository
    return _fetchMatchs();
  }

  Future<void> addMatch(Match match) async {
    // Set the state to loading
    state = const AsyncValue.loading();
    // Add the new match and reload the match list from the remote repository
    state = await AsyncValue.guard(() async {
      await http.post(Uri.http('localhost:3000', '/matchs'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(match.toJson()));
      return _fetchMatchs();
    });
  }

  // Let's allow removing matchs
  Future<void> removeMatch(String matchId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await http.delete(Uri.http('localhost:3000', '/matchs/$matchId'));
      return _fetchMatchs();
    });
  }

}

final asyncMatchsProvider =
    AsyncNotifierProvider<AsyncMatchsNotifier, List<Match>>(() {
  return AsyncMatchsNotifier();
});
