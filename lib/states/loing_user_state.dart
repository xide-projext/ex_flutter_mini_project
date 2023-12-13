import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/user.dart';

enum LoginState {
  none,
  email,
  naver,
  facebook,
  apple
}


class AsyncLoginUserNotifier extends StateNotifier<AsyncValue<User>> {
  AsyncLoginUserNotifier() : super(AsyncValue.loading());

  loading() {
    return AsyncValue.data(User(id: -1, name: 'John Doe', email: ''));
  }
  
  Future<void> login(String username, String password) async {
    state = AsyncValue.loading();
    try {
      // 여기서 실제 로그인 로직을 구현합니다.
      // 예를 들어, 서버 API 호출을 통해 사용자 정보를 가져옵니다.
      await Future.delayed(Duration(seconds: 2)); // 로그인 시뮬레이션

      // 로그인 성공 시
      final user = User(id: 1, name: 'John Doe', email: 'john@example.com');
      state = AsyncValue.data(user);
    } catch (e, stackTrace) {
      // 에러 처리
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final loginUserState = StateNotifierProvider<AsyncLoginUserNotifier, AsyncValue<User>>((ref) {
  return AsyncLoginUserNotifier();
});
