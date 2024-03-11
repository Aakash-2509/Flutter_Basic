import 'package:day_2/intropage.dart';
import 'package:day_2/stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userName = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // print('Single Tap');
                  },
                  child: Image.asset(
                    'assets/images/flutter_img.png',
                    height: 200,
                    // width: 200,
                    // alignment: Alignment.topCenter,
                    // color: Colors.amber,
                  ),
                ),
                // const SizedBox(height: 30),
                // Image.asset(
                //   'assets/images/flutter_img.png',
                //   height: 200,
                //   // width: 200,
                //   // alignment: Alignment.topCenter,
                //   // color: Colors.amber,
                // ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: userName,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 3),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "Enter username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 3),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "Enter password",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // String uname = userName.text.toString();
                    // String pass = password.text.toString();
        
                    // print('UserName: $userName + Password : $password');
        
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => IntroPage(name: userName),
                    //   ),
                    // );
                    // void abc(){};
                    Get.to(
                        IntroPage(
                          name: userName.text,
                        ),
                        transition: Transition.rightToLeftWithFade);
                  },
                  child: const Text(
                    " Log In",
                  ),

                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      const StackScreen(),
                      transition: Transition.rightToLeftWithFade
                    );
                  },
                  child: const Text('Stack Eg'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
