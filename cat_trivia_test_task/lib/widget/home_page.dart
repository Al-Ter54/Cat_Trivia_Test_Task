import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc.dart';
import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_state.dart';
import 'package:cat_trivia_test_task/feature/fact/widget/fact_page.dart';
import 'package:cat_trivia_test_task/feature/history/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FactBloc>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Fact"),
              Tab(text: "Fact history"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<FactBloc, FactBlocState>(
              builder: ((context, FactBlocState state) {
                return FactPage(
                  state: state,
                  bloc: bloc,
                );
              }),
            ),
            const HistoryWidget(),
          ],
        ),
      ),
    );
  }
}
