import 'package:flutter/material.dart';
import 'questionsmanager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

QuestionManager quemanger = QuestionManager();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: page(),
          ),
        ),
      ),
    );
  }
}

class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  List<Icon> score = [];
  int abc = 0;
  void checkans(bool userans) {
    bool answer = quemanger.answer();
    setState(() {
      if (answer == userans) {
        abc++;
        score.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        score.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      if (quemanger.total() == score.length) {
        Alert(
          context: context,
          title: "ALERT!!!",
          content: Column(
            children: [
              Text('Test is completed', textAlign: TextAlign.center),
              Text('Your score is $abc.', textAlign: TextAlign.center),
            ],
          ),
          buttons: [
            DialogButton(
              child: Text(
                "Try again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        score.clear();
        quemanger.reset();
        abc = 0;
      }
      quemanger.nextquestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quemanger.questiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              checkans(true);
            },
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  "YES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              checkans(false);
            },
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
