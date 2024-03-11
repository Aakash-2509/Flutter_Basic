import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third?a=1&&b=2');
              },
              child: const Text('Navigate to third page'),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.back();
            //     },
            //     child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
