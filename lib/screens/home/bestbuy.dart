//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/components/task_item.dart';
import 'package:retail_io/models/task.dart';

class BestBuy extends StatelessWidget {
  static final tasks = <Task>[
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
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
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
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
    QnATask(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
      taskText: const [
        TextSpan(text: "Answer: "),
        TextSpan(
            text: 'How much money can you save?',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      reward: 150,
      imagePath: "assets/products/tv.png",
      question:
          "This TCL 55\" 4K Smart Roku TV is normally \$499.99 but is 20% off at Best Buy. How much will you save if you buy it right now?",
      answers: const ["\$50", "\$80", "\$100"],
      correctAnswers: const {2},
    ),
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
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
    ScanTask(
      gradient: LinearGradient(
        colors: [
          Colors.yellowAccent.shade400,
          Colors.yellowAccent.shade700,
        ],
      ),
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
