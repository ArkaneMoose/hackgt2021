import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/material.dart' as material;
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';

class AppBar extends material.AppBar {
  AppBar({title = "retail.io", Key? key})
      : super(
          key: key,
          elevation: 0,
          title: Text(title),
          actions: <Widget>[
            Row(
              children: const [
                CoinIcon(),
                SizedBox(width: kDefaultPadding / 4),
                Text("100", style: TextStyle(fontSize: 20)),
                SizedBox(width: kDefaultPadding / 2),
              ],
            )
          ],
        );
}
