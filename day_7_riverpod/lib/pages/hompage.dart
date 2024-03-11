import 'package:day_7_riverpod/pages/providerpage.dart';
import 'package:day_7_riverpod/pages/stateprovider.dart';
import 'package:day_7_riverpod/pages/streamprovider.dart';
import 'package:flutter/material.dart';

import 'futureprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderPage(),
                    ),
                  );
                },
                child: const Text('Provider'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StateProviderScreen(),
                    ),
                  );
                },
                child: const Text('State Provider'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FutureProviderScreen(),
                    ),
                  );
                },
                child: const Text('Future Provider'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreamProviderScreen(),
                    ),
                  );
                },
                child: const Text('Stream Provider'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StateProviderScreen(),
                    ),
                  );
                },
                child: const Text('Change Notifier Provider'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StateProviderScreen(),
                    ),
                  );
                },
                child: const Text('State Notifier Provider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
