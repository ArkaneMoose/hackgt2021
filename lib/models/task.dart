import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Task {
  String get type;
  final List<InlineSpan> taskText;
  final int reward;
  final String imagePath;
  final Gradient gradient;

  const Task({
    required this.taskText,
    required this.reward,
    required this.imagePath,
    required this.gradient,
  });
}

@immutable
class ScanTask extends Task {
  final String upc;

  const ScanTask({
    required List<InlineSpan> taskText,
    required int reward,
    required String imagePath,
    required Gradient gradient,
    required this.upc,
  }) : super(
          taskText: taskText,
          reward: reward,
          imagePath: imagePath,
          gradient: gradient,
        );

  @override
  String get type => "Scavenger Hunt";
}

@immutable
class QnATask extends Task {
  final String question;
  final List<String> answers;
  final Set<int> correctAnswers;

  const QnATask({
    required List<InlineSpan> taskText,
    required int reward,
    required String imagePath,
    required Gradient gradient,
    required this.question,
    required this.answers,
    required this.correctAnswers,
  }) : super(
          taskText: taskText,
          reward: reward,
          imagePath: imagePath,
          gradient: gradient,
        );

  @override
  String get type => "Question Challenge";
}
