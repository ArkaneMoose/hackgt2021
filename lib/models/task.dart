import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
class Task {
  final String type;
  final List<InlineSpan> taskText;
  final int reward;
  final String imagePath;
  final Gradient gradient;
  final String upc;

  const Task({
    required this.type,
    required this.taskText,
    required this.reward,
    required this.imagePath,
    required this.gradient,
    required this.upc,
  });
}
