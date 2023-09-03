import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  Response(this.results, {super.key});

  final List<Map<String, Object>> results;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: results.map((e) {
        return Row(
          children: [
            Text(e['id'].toString()),
            Expanded(
              child: Column(
                children: [
                  Text(e['question'].toString()),
                  const SizedBox(height: 10),
                  Text(e['answer'].toString()),
                  const SizedBox(height: 10),
                  Text(e['response'].toString()),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
