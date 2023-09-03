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
                  child: Text(
                    e['id'].toString(),
                    style:  TextStyle(
                        color: Colors.white,
                        backgroundColor: (e['answer'].toString()==e['response'].toString())?Colors.blue:Colors.green,
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
