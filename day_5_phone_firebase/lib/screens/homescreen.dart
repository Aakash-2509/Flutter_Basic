import 'package:day_5_phone_firebase/cubits/auth_cubits/auth_cubit.dart';
import 'package:day_5_phone_firebase/cubits/auth_cubits/auth_state.dart';
import 'package:day_5_phone_firebase/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("HomeScreen"),
        ),
        body: SafeArea(
          child: Center(
              child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CupertinoButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logOut();
                },
                child: const Text('Log Out'),
              );
            },
          )),
        ),
      ),
    );
  }
}
