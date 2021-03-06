import 'package:flutter/material.dart';
import 'package:retail_io/constants.dart';

class StoreItem extends StatelessWidget {
  final String imagePath;
  final Gradient gradient;
  final void Function() onTap;

  const StoreItem({
    required this.imagePath,
    required this.gradient,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: gradient,
          ),
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Image.asset(
                imagePath,
                width: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
