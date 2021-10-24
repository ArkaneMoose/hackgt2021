import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/models/task.dart';
import 'package:retail_io/screens/camera_scan/camera_scan_screen.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return CameraScanScreen(task: task);
          }));
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: task.gradient,
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: Image.asset(
                    task.imagePath,
                    width: 80,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.type.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                          children: task.taskText,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: "Reward:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: " "),
                            const WidgetSpan(
                              child: CoinIcon(size: 20),
                            ),
                            TextSpan(text: " ${task.reward}"),
                          ],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
