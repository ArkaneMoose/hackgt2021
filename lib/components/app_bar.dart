import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/material.dart' as material;
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';
import 'package:provider/provider.dart';
import 'package:retail_io/models/coins.dart';
import 'package:retail_io/screens/home/redeem_rewards.dart';

class AppBar extends material.AppBar {
  AppBar({title = "retail.io", required BuildContext context, Key? key})
      : super(
          key: key,
          elevation: 0,
          title: Text(title),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const Rewards();
                  }));
                },
                child: Row(
                  children: [
                    const CoinIcon(),
                    const SizedBox(width: kDefaultPadding / 4),
                    Consumer<CoinsModel>(
                      builder: (context, model, child) => Text(
                        "${model.coins}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                  ],
                ))
          ],
        );
}
