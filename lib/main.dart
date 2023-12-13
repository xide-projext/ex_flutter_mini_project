import 'package:ex_mini_project/presentations/game_record_page.dart';
import 'package:ex_mini_project/presentations/game_create_page.dart';
import 'package:ex_mini_project/presentations/game_join_page.dart';
import 'package:ex_mini_project/presentations/game_list_page.dart';
import 'package:ex_mini_project/presentations/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
// final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return MaterialApp(
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => LoginPage());
            case '/games/create':
              return MaterialPageRoute(builder: (context) => CreateGamePage());
            case '/games':
              return MaterialPageRoute(builder: (context) => GameListPage());
            case '/games/join':
              return MaterialPageRoute(builder: (context) => JoinGamePage());
            case '/games/record':
              // id 추출
              final String gameId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => ScoreRecordPage(gameId: gameId),
              );
            default:
              return MaterialPageRoute(builder: (context) => LoginPage());
          }
      //   routes: {
      //   '/': (context) => LoginPage(),
      //   '/games/create': (context) => CreateGamePage(),
      //   '/games/': (context) => GameListPage(),
      //   '/games/join': (context) => JoinGamePage(),
      //   '/games/:id/record': (context) => ScoreRecordPage(),
      //   // 추가 라우트가 필요한 경우 여기에 정의
      // }
     });
    });
  }
}
