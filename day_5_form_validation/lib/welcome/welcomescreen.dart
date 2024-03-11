import 'package:day_5_form_validation/sign_in/bloc/sign_in_bloc.dart';
import 'package:day_5_form_validation/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => BlocProvider(
                      create: (context) => SignInBloc(),
                      child: SignInScreen(),
                    ),
                  );
                },
                child: const Text("Sign in with Email"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Sign in with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
