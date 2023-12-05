import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ex_mini_project/provider/userProvider.dart';
import 'package:ex_mini_project/models/user.dart';

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
      final asyncUsers = ref.watch(asyncUsersProvider);
      final userNotifier = ref.read(asyncUsersProvider.notifier);

      TextEditingController nameController = TextEditingController();

      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
            child: switch (asyncUsers) {
          AsyncData(:final value) => ListView(
              children: [
                for (final user in value)
                  ListTile(
                    title: Text(user.name!),
                  ),
                  // 추가: 사용자 추가 폼
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final newUser = User(name: nameController.text);
                          userNotifier.addUser(newUser);
                          nameController.clear();
                        },
                        child: Text('Add User'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          AsyncError(:final error) => Text('Error: $error'),
          _ => const Center(child: CircularProgressIndicator()),
        }),
      ));
    });
  }
}
