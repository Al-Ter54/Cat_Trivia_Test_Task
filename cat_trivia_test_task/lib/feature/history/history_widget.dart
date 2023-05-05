import 'package:cat_trivia_test_task/widget/fact_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('facts').listenable(),
      builder: (context, box, widget) {
        return Center(
          child: ListView.builder(
            itemCount: box.length,
            itemBuilder: ((context, index) {
              return FactItem(fact: box.getAt(index),);
            }),
          ),
        );
      },
    );
  }
}
