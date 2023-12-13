import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ex_mini_project/provider/match_povider.dart';
import 'package:flutter/gestures.dart';
import 'package:ex_mini_project/models/match.dart';

class GameListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final asyncMatchs = ref.watch(asyncMatchsProvider);
      final userNotifier = ref.read(asyncMatchsProvider.notifier);

      TextEditingController nameController = TextEditingController();

      return Scaffold(
          appBar: AppBar(title: const Text('Example')),
          body: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                physics: const BouncingScrollPhysics(),
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad
                },
              ),
              child: RefreshIndicator(
                onRefresh: () => ref.refresh(asyncMatchsProvider
                    .future), // RefreshIndicator를 사용하여 화면을 아래로 당겨 새로고침 가능
                child: Center(
                    child: switch (asyncMatchs) {
                  AsyncData(:final value) => ListView(
                      children: [
                        for (final user in value)
                          ListTile(
                            title: Text("${user.player1}"),
                          ),
                        // 추가: 사용자 추가 폼
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final newMatch = Match(
                                      player1: int.parse(nameController.text));
                                  userNotifier.addMatch(newMatch);
                                  nameController.clear();
                                },
                                child: const Text('Add Match'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  AsyncError(:final error) => Text('Error: $error'),
                  _ => const Center(child: CircularProgressIndicator()),
                }),
              )));
    });
  }
}
