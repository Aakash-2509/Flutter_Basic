import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_state_manager/simplecontroller.dart';

class SimpleHome extends StatelessWidget {
  const SimpleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SimpleController>(
              init: SimpleController(), // 
              builder: (simpleController) => Text(
                '${simpleController.count}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var myController = Get.find<SimpleController>();
                myController.incrementCounter();
              },
              child: const Text(
                'Increment',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
