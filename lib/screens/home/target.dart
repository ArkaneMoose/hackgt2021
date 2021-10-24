//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/components/task_item.dart';
import 'package:retail_io/models/task.dart';

class Target extends StatelessWidget {
  static final tasks = <Task>[
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent.shade400,
          Colors.redAccent.shade700,
        ],
      ),
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "up & up Advanced Dishwasher Packs",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 50,
      imagePath: "assets/products/pods.png",
      upc: "",
    ),
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent.shade400,
          Colors.redAccent.shade700,
        ],
      ),
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "up & up Premium Ultra Strong Toilet Paper",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 80,
      imagePath: "assets/products/toilet_paper.png",
      upc: "",
    ),
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent.shade400,
          Colors.redAccent.shade700,
        ],
      ),
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "up & up Replacement Water Filters",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 150,
      imagePath: "assets/products/water_filter.png",
      upc: "",
    ),
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent.shade400,
          Colors.redAccent.shade700,
        ],
      ),
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "up & up 2 Pocket Plastic Folder with Prongs",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 100,
      imagePath: "assets/products/folder.png",
      upc: "",
    ),
  ];

  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
      child: Scaffold(
        backgroundColor: Colors.redAccent.shade200,
        appBar: AppBar(context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tasks.map((task) => TaskItem(task: task)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
