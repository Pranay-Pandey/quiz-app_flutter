import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  const Response(this.results, {Key? key}) : super(key: key);

  final List<Map<String, Object>> results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: results.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
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
                            : Colors.red,
                      ),
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
                      crossAxisAlignment: CrossAxisAlignment.start, // Left-align text
                      children: [
                        // Align(
                          Text(
                            e['question'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        // ),
                        Text(
                          e['answer'].toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 217, 3, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          e['response'].toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 251, 236, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
