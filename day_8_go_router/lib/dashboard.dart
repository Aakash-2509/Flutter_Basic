import 'package:day_8_go_router/routesName.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashborad"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // GoRouter.of(context).go('/profile');
            context.goNamed(RoutesName.profile);
          },
          child: const Text('Go To Profile'),
        ),
      ),
    );
  }
}
