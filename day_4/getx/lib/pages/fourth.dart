import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is the last screen',style: TextStyle(
            fontSize: 20,
            backgroundColor: Colors.cyan
          ),),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('back'))
        ],
      )),
    );
  }
}
