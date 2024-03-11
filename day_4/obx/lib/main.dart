import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx/movie.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  var movie = Movie(name: 'Wanted', ticket: 200).obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Obx Eg'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  '${movie.value.name}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  movie.value.name = '12th Fail!';
                  movie.refresh();
                },
                child: const Text('Change'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















// class MyApp extends StatelessWidget {   Obx variable
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var count = 0.obs;
//     return GetMaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Obx Example'),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Obx(
//                   () => Text('$count'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     count++;
//                   },
//                   child: const Text("Increment"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
