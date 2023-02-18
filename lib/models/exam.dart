import 'package:flutter/material.dart';

class Exam {
  final String id;
  final String subject;
  final DateTime date;
  final TimeOfDay time;

  Exam(
      {required this.id,
      required this.subject,
      required this.date,
      required this.time});
}
