import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_getx/myController.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // var mycontroller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home View'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetX<MyController>(
                  init: MyController(),
                  builder: (myController) => Text(
                    "${myController.count}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                // Obx(
                //   () => Text(
                //     '${mycontroller.count}',
                //     style: const TextStyle(fontSize: 30),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    var ctrl = Get.find<MyController>();
                    ctrl.incrementController();
                    // mycontroller.incrementController();
                  },
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var ctrl = Get.find<MyController>();
                    ctrl.count.value = 0;
                    // mycontroller.count.value = 0;
                  },
                  child: const Text('Restart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
