import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/pages/first.dart';
import 'package:getx/pages/fourth.dart';
import 'package:getx/pages/third.dart';

import 'pages/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'first',
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(name: "/first", page: () => const FirstPage()),
        GetPage(name: "/second", page: () => const SecondPage()),
        GetPage(name: "/third", page: () => const ThirdPage()),
        GetPage(name: "/fourth", page: () => const FourthPage()),
      ],
    );
  }
}
