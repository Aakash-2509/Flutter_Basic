import 'package:day_8_go_router/dashboard.dart';
import 'package:day_8_go_router/profile.dart';
import 'package:day_8_go_router/routesName.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Go Router",
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
        name: RoutesName.dashboard,
        path: '/',
        builder: (context, state) => const Dashborad()),
    GoRoute(
        name: RoutesName.profile,
        path: '/profile',
        builder: (context, state) => const Profile())
  ]);

  // final GoRouter _router = GoRouter(
  //   // initialLocation: '/profile',
  //   routes: [
  //     GoRoute(
  //       path: '/',
  //       builder: (context, state) => const Dashborad(),
  //       routes: [
  //         GoRoute(
  //           path: 'profile',
  //           builder: ((context, state) => const Profile()),
  //         ),
  //       ],
  //     ),
  //   ],
  // );
}
