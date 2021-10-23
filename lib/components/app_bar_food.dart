import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackgt2021/screens/cart/cart_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hackgt2021/constants.dart';

AppBar foodAppBar(BuildContext context) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: kPrimaryColorFood.withOpacity(0.08),
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
            text: "Food",
            style: TextStyle(color: kPrimaryColorFood),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Ionicons.cart_outline, color: kDarkPrimaryColor),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return const CartScreen();
              },
            ),
          );
        },
      ),
      const SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
