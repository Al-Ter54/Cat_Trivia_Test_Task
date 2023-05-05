import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc.dart';
import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_event.dart';
import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_state.dart';
import 'package:cat_trivia_test_task/widget/fact_item.dart';
import 'package:flutter/material.dart';

class FactPage extends StatelessWidget {
  const FactPage({
    Key? key,
    required this.state,
    required this.bloc,
  }) : super(key: key);
  final FactBlocState state;
  final FactBloc bloc;

  void getNewFact() {
    bloc.add(FactBlocEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: getNewFact,
                child: const Text("Another fact!"),
              ),
            ),
          ),
          _blocContent(),
        ],
      ),
    );
  }

  Widget _blocContent() {
    if (state is FactBlocStateEmpty) {
      return const Center(
        child: Text("Empty state"),
      );
    }
    if (state is FactBlocStateLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is FactBlocStateError) {
      return Center(
          child: Text((state as FactBlocStateError).error.toString()));
    }
    if (state is FactBlocStateData) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FactItem(fact: (state as FactBlocStateData).fact),
          _showImage((state as FactBlocStateData).image.url ?? ""),
        ],
      );
    }
    return const Center(
      child: Text("Something went wrong"),
    );
  }

  Widget _showImage(String url) {
    if (url.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: Center(
          child: Image.network(
            url,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      );
    }
    return const Text("No image");
  }
}
