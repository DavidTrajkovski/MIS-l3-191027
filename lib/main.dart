import 'package:flutter/material.dart';

import 'widgets/new_exam.dart';
import 'widgets/exam_list.dart';
import 'models/exam.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIS lab3 191027',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                  subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .bodyText2,
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                  subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .headline6,
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> _userExams = [];

  void _addNewExam(
    String examSubject, DateTime chosenDate, TimeOfDay chosenTime) {
    final newExam = Exam(
      subject: examSubject,
      date: chosenDate,
      time: chosenTime,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userExams.add(newExam);
    });
  }

  void _openAddNewExamModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewExam),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteExam(String id) {
    setState(() {
      _userExams.removeWhere((x) => x.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exam Planner',
          style: TextStyle(fontSize: 25, color: Colors.white)
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddNewExamModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExamList(_userExams, _deleteExam),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        onPressed: () => _openAddNewExamModal(context),
      ),
    );
  }
}
