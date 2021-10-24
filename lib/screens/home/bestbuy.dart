//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/components/task_item.dart';
import 'package:retail_io/models/task.dart';

class BestBuy extends StatelessWidget {
  static final tasks = <Task>[
    Task(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      type: "Scavenger Hunt",
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "MonoPrice 6 Outlet Slim Power Surge Protector",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 50,
      imagePath: "assets/products/surge_protector.png",
      upc: "844660091998",
    ),
    Task(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      type: "Scavenger Hunt",
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "Canon - EOS 90D DSLR Camera with EF-S 18-135mm Lens - Black",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 80,
      imagePath: "assets/products/camera.png",
      upc: "",
    ),
    Task(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      type: "Question Challenge",
      taskText: const [
        TextSpan(text: "Answer: "),
        TextSpan(
            text: 'How much money can you save?',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 150,
      imagePath: "assets/products/tv.png",
      upc: "",
    ),
    Task(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      type: "Scavenger Hunt",
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text: "Dyson - V11 Torque Drive Cord-Free Vacuum - Blue/Nickel",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 100,
      imagePath: "assets/products/vacuum.png",
      upc: "",
    ),
    Task(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      type: "Scavenger Hunt",
      taskText: const [
        TextSpan(text: "Find "),
        TextSpan(
            text:
                "Bose SoundLink Colour II Splashproof Bluetooth Wireless Speaker - Black",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 100,
      imagePath: "assets/products/speaker.png",
      upc: "",
    ),
  ];

  const BestBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent.shade100,
        appBar: AppBar(),
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
