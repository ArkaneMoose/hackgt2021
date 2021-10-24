//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/components/task_item.dart';

class Publix extends StatelessWidget {
  const Publix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
      child: Scaffold(
        backgroundColor: Colors.lightGreen.shade100,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                TaskItem(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreen,
                    ],
                  ),
                  type: "Scavenger Hunt",
                  taskText: [
                    TextSpan(text: "Find "),
                    TextSpan(
                        text: "Publix Dip-Style Potato Chips",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  reward: 50,
                  imagePath: "assets/products/chips.png",
                ),
                TaskItem(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreen,
                    ],
                  ),
                  type: "Scavenger Hunt",
                  taskText: [
                    TextSpan(text: "Find "),
                    TextSpan(
                        text: "Publix Club Soda",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  reward: 80,
                  imagePath: "assets/products/club_soda.png",
                ),
                TaskItem(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreen,
                    ],
                  ),
                  type: "Scavenger Hunt",
                  taskText: [
                    TextSpan(text: "Find "),
                    TextSpan(
                        text: "Publix Frosted Sugar Cookies 10-Count",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  reward: 150,
                  imagePath: "assets/products/cookies.png",
                ),
                TaskItem(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreen,
                    ],
                  ),
                  type: "Scavenger Hunt",
                  taskText: [
                    TextSpan(text: "Find "),
                    TextSpan(
                        text: "Publix Creamy Peanut Butter",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  reward: 100,
                  imagePath: "assets/products/pb.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
