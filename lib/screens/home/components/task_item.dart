import 'package:flutter/material.dart';
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';

class TaskItem extends StatelessWidget {
  final String type;
  final List<InlineSpan> taskText;
  final int reward;
  final String imagePath;
  final Gradient gradient;

  const TaskItem({
    required this.type,
    required this.taskText,
    required this.reward,
    required this.imagePath,
    required this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: Image.asset(
                  imagePath,
                  width: 80,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 4),
                    RichText(
                      text: TextSpan(
                        children: taskText,
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
                          TextSpan(text: " $reward"),
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
    );
  }
}
