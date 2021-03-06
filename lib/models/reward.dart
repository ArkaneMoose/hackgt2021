import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
class Reward {
  final String type;
  final List<InlineSpan> taskText;
  final int cost;
  final String imagePath;
  final Gradient gradient;
  final String upc;

  const Reward({
    required this.type,
    required this.taskText,
    required this.cost,
    required this.imagePath,
    required this.gradient,
    required this.upc,
  });
}
