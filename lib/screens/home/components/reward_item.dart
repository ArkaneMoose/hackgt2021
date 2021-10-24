import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/models/reward.dart';
import 'package:retail_io/screens/camera_scan/camera_scan_screen.dart';

class RewardItem extends StatelessWidget {
  final Reward reward;

  const RewardItem({
    required this.reward
    Key? key,
    required LinearGradient gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child:
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: reward.gradient,
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: Image.asset(
                    reward.imagePath,
                    width: 80,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.type.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                          children: reward.rewardText,
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
                                text: "Cost:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: " "),
                            const WidgetSpan(
                              child: CoinIcon(size: 20),
                            ),
                            TextSpan(text: " ${reward.reward}"),
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
