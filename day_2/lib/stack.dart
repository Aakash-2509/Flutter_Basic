import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stcak Example"),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: Stack(
              children: [
                // const TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.red,
                //   ),
                // ),
                // const Positioned(
                //   top: 100,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Color.fromARGB(255, 210, 177, 177)
                //     ),
                //   ),
                // ),
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.black,
                ),
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.brown,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Image.asset(
                    'assets/images/flutter_img.png',
                    // width: 400,
                    // height: 400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
