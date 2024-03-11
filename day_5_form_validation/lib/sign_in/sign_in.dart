import 'package:day_5_form_validation/sign_in/bloc/sign_in_bloc.dart';
import 'package:day_5_form_validation/sign_in/bloc/sign_in_event.dart';
import 'package:day_5_form_validation/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In with Email'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text),
                    );
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text),
                    );
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  return CupertinoButton(
                    onPressed: () {},
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: const Text("Sign In"),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
