import 'package:family_modifier_rp/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider.family<String, User>((ref, user) {
  return "Name : ${user.name} and Address : ${user.address}";
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider(const User('Aakash', 'Pune')));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Modifier'),
      ),
      body: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
