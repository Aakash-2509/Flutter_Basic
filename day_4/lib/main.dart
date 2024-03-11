import 'package:day_4/nextpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1 = 10;
  int num2 = 10;
  int tempNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set State"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$tempNum'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tempNum = num1 + num2;
                });
              },
              child: const Text('Add Two Numbers'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tempNum = 0;
                });
              },
              child: const Text('Restart'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const NextPage(),
                  transition: Transition.cupertino,
                  arguments: tempNum!.toString(),
                );
              },
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
