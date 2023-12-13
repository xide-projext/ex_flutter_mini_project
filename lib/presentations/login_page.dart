import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ex_mini_project/states/loing_user_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final userState = ref.watch(loginUserState); // 생태 변경 감지용
      final userNotifier = ref.read(loginUserState.notifier); // 함수 실행용

      return Scaffold(
        appBar: AppBar(title: Text('로그인')),
        body: Center(
          child: userState.when(
            data: (user){ // 로그인이 되어있는 경우
              return Column(
                children: [
                  Text('로그인됨: ${user.name}'),
                  ElevatedButton(
                  onPressed: () async {
                    // 로그인 로직 구현
                    await userNotifier.login("", "");
                  },
                  child: Text('홈으로 이동 '),
                ),
                ],
              );
            },
            loading: () { // 로그인이 되어있지 않은 경우
              return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(decoration: InputDecoration(labelText: '사용자 이름')),
                TextFormField(
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // 로그인 로직 구현
                    await userNotifier.login("id", "pw");
                  },
                  child: Text('로그인'),
                ),
              ],
            );
            },
            error: (error, stack) =>CircularProgressIndicator(),
          ),
        ),
      );
    });
  }
}
