import 'package:cat_trivia_test_task/model/fact.dart';
import 'package:flutter/material.dart';

class FactItem extends StatelessWidget {
  const FactItem({Key? key, required this.fact}) : super(key: key);
  final Fact fact;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(fact.text ?? ""),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    DateTime.parse(fact.createdAt ?? "").toLocal().toString(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
