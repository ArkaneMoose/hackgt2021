import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hackgt2021/constants.dart';

AppBar groceryAppBar(BuildContext context) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: kPrimaryColorGrocery.withOpacity(0.08),
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
        children: const [
          TextSpan(
            text: "Pokt",
            style: TextStyle(color: kDarkPrimaryColor),
          ),
          TextSpan(
            text: "Grocery",
            style: TextStyle(color: kPrimaryColorGrocery),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Ionicons.cart_outline, color: kDarkPrimaryColor),
        onPressed: () {},
      ),
      const SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
