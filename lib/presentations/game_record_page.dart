import 'package:flutter/material.dart';

class ScoreRecordPage extends StatelessWidget {
final String gameId;

  // 생성자를 통해 gameId를 받습니다.
  ScoreRecordPage({Key? key, required this.gameId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('게임 점수 기록')),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Game ID: $gameId'), // 여기에서 gameId를 활용할 수 있습니다.
            // 참여한 게임 목록을 ListView 또는 유사한 위젯으로 표시
            // 점수 입력 인터페이스 추가
          ],
        ),
      ),
    );
  }
}
