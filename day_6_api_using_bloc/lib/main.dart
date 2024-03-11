import 'dart:developer';

import 'package:day_6_api_using_bloc/data/models/post_model.dart';
import 'package:day_6_api_using_bloc/data/models/repositories/post_repository.dart';
import 'package:day_6_api_using_bloc/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PostRepository postRepository = PostRepository();
  List<PostModel>? postModels = await postRepository.fetchPost();
  log(postModels.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
