import 'package:day_5/bloc/internet_bloc/internet_bloc.dart';
import 'package:day_5/bloc/internet_bloc/internet_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: SafeArea(
        child: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Lost"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected!");
            } else if (state is InternetLostState) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading...');
            }
          },
        )

            // child: BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            // if (state is InternetGainedState) {
            //   return const Text("Connected!");
            // } else if (state is InternetLostState) {
            //   return const Text('Not Connected!');
            // } else {
            //   return const Text('Loading...');
            // }
            //   },
            // ),

            ),
      ),
    );
  }
}
