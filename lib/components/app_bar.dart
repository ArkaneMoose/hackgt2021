import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/material.dart' as material;
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';
import 'package:provider/provider.dart';
import 'package:retail_io/models/coins.dart';

class AppBar extends material.AppBar {
  AppBar({title = "retail.io", Key? key})
      : super(
          key: key,
          elevation: 0,
          title: Text(title),
          actions: <Widget>[
            Row(
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
            )
          ],
        );
}
