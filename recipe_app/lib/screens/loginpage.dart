import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void signInError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: const Text('Please input valid credentials'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        signInError();
      }
    }
  }

  signInWithPhone() {
    // Implement phone authentication logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'Enter Password'),
            ),
            ElevatedButton(
              onPressed: signInWithEmailAndPassword,
              child: const Text('Login'),
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     Get.to(const PhoneAuthWidget());
            //   },
            //   child: const Text('Login with Phone'),
            // )
          ],
        ),
      ),
    );
  }
}
