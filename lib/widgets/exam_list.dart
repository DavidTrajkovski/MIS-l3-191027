import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam.dart';

class ExamList extends StatelessWidget {
  final List<Exam> examList;
  final Function deleteExamSchedule;

  ExamList(this.examList, this.deleteExamSchedule);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: examList.isEmpty
          ? Column(
              children: <Widget>[
                Container(child: 
                Text(
                  'No exams scheduled!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                margin: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 4,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 4,
                  ),
                  child: ListTile(
                    title: Text(
                      examList[index].subject,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                        '${DateFormat.yMMMd().format(examList[index].date)} '
                        '${(examList[index].time.format(context))}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteExamSchedule(examList[index].id),
                    ),
                  ),
                );
              },
              itemCount: examList.length,
            ),
    );
  }
}
