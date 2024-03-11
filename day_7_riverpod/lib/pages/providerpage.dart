import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 422555);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: 
      Center(
        child: Text("The value of the provider is ${ref.watch(valueProvider)}"),
      )
      // Consumer(
      //   builder: (context, ref, child) {
      //     return Center(
      //       child: Text(
      //           "The value of the provider is ${ref.watch(valueProvider)}"),
      //     );
      //   },
      // ),
    );
  }
}
