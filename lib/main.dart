import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple quiz app",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Simple quiz app",
          ),
          centerTitle: true,
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> question = [
    {
      "question":
          "Which of the following widgets used for repeating the content",
      "Answer": [
        {"ans": "Expanded", "correct": 6},
        {"ans": "Listview", "correct": 10},
        {"ans": "Stack", "correct": 0},
        {"ans": "Scaffold", "correct": 8},
      ],
    },
    {
      "question": "Which of the following widgets use for layout",
      "Answer": [
        {"ans": "Text", "correct": 8},
        {"ans": "Column", "correct": 10},
        {"ans": "Expanded", "correct": 0},
        {"ans": "Inkwell", "correct": 4},
      ],
    },
    {
      "question": "Which of these is NOT a pro for Flutter?",
      "Answer": [
        {"ans": "free and open source", "correct": 0},
        {"ans": "Highly productive and high performance", "correct": 6},
        {
          "ans": "Develop for iOS and Android from a single codebase",
          "correct": 8
        },
        {"ans": "More Testing", "correct": 10},
      ],
    },
    {
      "question": "Flutter uses one code base",
      "Answer": [
        {"ans": "true", "correct": 10},
        {"ans": "false", "correct": 0},
        {"ans": "", "correct": 4},
        {"ans": "", "correct": 3},
      ],
    },
    {
      "question": "What are build modes in flutter",
      "Answer": [
        {"ans": "All of above", "correct": 10},
        {"ans": "debug", "correct": 0},
        {"ans": "Profile", "correct": 4},
        {"ans": "Release", "correct": 3},
      ],
    },
    {
      "question": "What are the best editors for flutter development?",
      "Answer": [
        {"ans": "Android Studio", "correct": 10},
        {"ans": "X Code", "correct": 0},
        {"ans": "Intellij idea", "correct": 4},
        {"ans": "Release", "correct": 3},
      ],
    }
  ];
  int questionNmbr = 0;
  void nextquestion() {
    setState(() {
      if (questionNmbr <= question.length - 1) {
        questionNmbr++;
      }
    });
  }

  int Score = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
      child: Center(
        child: questionNmbr > question.length - 1
            ? Container(
                child: AlertDialog(
                  title: Text("Congradulation"),
                  content: Text("Your total score is : $Score"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Score = 0;
                            questionNmbr = 0;
                          });
                        },
                        child: Text("Reset"))
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    question[questionNmbr]['question'].toString(),
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...(question[questionNmbr]['Answer']
                                as List<Map<String, dynamic>>)
                            .map((e) {
                          return ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "your score is ${e['correct']}",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                              nextquestion();
                              Score += e['correct'] as int;
                            },
                            child: Text(e['ans']),
                          );
                        }).toList(),
                      ]),
                ],
              ),
      ),
    );
  }
}
