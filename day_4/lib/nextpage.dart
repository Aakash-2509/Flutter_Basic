import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: Text(Get.arguments),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Click me to go to the Pervious Page")
          ],
        ),
      ),
    );
  }
}
