import 'package:flutter/material.dart';
import 'package:hackgt2021/constants.dart';

AppBar profileAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
        children: const [
          TextSpan(
            text: "Your ",
            style: TextStyle(color: kDarkPrimaryColor),
          ),
          TextSpan(
            text: "Pokt",
            style: TextStyle(color: kPrimaryColorFood),
          ),
        ],
      ),
    ),
  );
}
