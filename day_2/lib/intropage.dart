import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Intro Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: Colors.amber,
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 31, 30, 28),
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 218, 193, 144),
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 96, 81, 50),
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 234, 228, 216),
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 59, 42, 7),
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        color: const Color.fromARGB(255, 227, 155, 11),
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Welcome $name ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
