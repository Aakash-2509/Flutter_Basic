import 'package:day_7_riverpod/ui/model/suggestion.dart';
import 'package:day_7_riverpod/ui/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final suggestionFutureProvider = FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProiver);
  return apiService.getSuggestion();
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future provider screen'),
        ),
        body: RefreshIndicator(
          onRefresh: () =>ref.refresh(suggestionFutureProvider.future),
          child: ListView(
            children: [
              Center(
                child: suggestionRef.when(
                    data: (data) {
                      return Text(
                        data.activity,
                      );
                    },
                    error: (error, _) {
                      return Text(error.toString());
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    }),
              ),
            ],
          ),
        ));
  }
}
