import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc.dart';
import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_event.dart';
import 'package:cat_trivia_test_task/model/fact.dart';
import 'package:cat_trivia_test_task/repository/repository.dart';
import 'package:cat_trivia_test_task/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FactAdapter());
  Hive.registerAdapter(StatusAdapter());
  runApp(
    MyApp(
      repository: Repository(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactBloc>(
      create: (_) => FactBloc(repository: repository)..add(FactBlocEventInit()),
      child: MaterialApp(
        title: 'Cat trivia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Cat trivia'),
      ),
    );
  }
}
