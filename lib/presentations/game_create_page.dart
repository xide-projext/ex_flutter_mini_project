import 'package:flutter/material.dart';

class CreateGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('게임 만들기')),
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButtonFormField(
              items: [], // 운동장 목록을 여기에 추가
              onChanged: (value) {},
              hint: Text('운동장 선택'),
            ),
            // 경기 가능 시간 선택 위젯 추가 예정
            ElevatedButton(
              onPressed: () {
                // 게임 생성 로직 구현
              },
              child: Text('생성'),
            ),
          ],
        ),
      ),
    );
  }
}
