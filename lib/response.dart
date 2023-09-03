import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  Response(this.results, {super.key});

  final List<Map<String, Object>> results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: results.map((e) {
            return Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        color: (e['answer'] == e['response'])
                            ? Colors.green
                            : Colors.red),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          e['id'].toString(),
                        ),
                      ],
                    ),
                  ),
                ),
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
        ),
      ),
    );
  }
}
