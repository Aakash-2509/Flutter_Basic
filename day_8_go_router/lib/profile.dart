import 'package:day_8_go_router/routesName.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Go to Dashboard'),
        onPressed: () {
          // GoRouter.of(context).go('/');
          context.goNamed(RoutesName.dashboard);
        },
      )),
    );
  }
}
