//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/components/reward_item.dart';
import 'package:retail_io/screens/home/components/task_item.dart';
import 'package:retail_io/models/reward.dart';

const publixGradient = LinearGradient(
  colors: [
    Colors.green,
    Colors.lightGreen,
  ],
);
final targetGradient = LinearGradient(colors: [
  Colors.redAccent.shade400,
  Colors.redAccent.shade700,
]);
final bestBuyGradient = LinearGradient(
  colors: [
    Colors.yellowAccent.shade400,
    Colors.yellowAccent.shade700,
  ],
);

class Rewards extends StatelessWidget {
  static final tasks = <Reward>[
    Reward(
      type: "Coupon",
      gradient: publixGradient,
      taskText: const [
        TextSpan(
            text: "\$5 off your purchase of \$40 or more",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      cost: 100,
      imagePath: "assets/products/publix.png",
      upc: "",
    ),
    Reward(
      type: "Gift Card",
      gradient: targetGradient,
      taskText: const [
        TextSpan(
            text: "\$5 gift card",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      cost: 500,
      imagePath: "assets/products/target.png",
      upc: "",
    ),
    Reward(
      type: "Coupon",
      gradient: bestBuyGradient,
      taskText: const [
        TextSpan(
            text: "\$10 off any smart watch",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      cost: 1000,
      imagePath: "assets/products/bestbuy.png",
      upc: "",
    ),
  ];

  const Rewards({Key? key}) : super(key: key);

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
              children: tasks
                  .map((task) => RewardItem(
                      reward: task,
                      gradient: LinearGradient(
                        colors: [
                          Colors.redAccent.shade400,
                          Colors.redAccent.shade700,
                        ],
                      )))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
