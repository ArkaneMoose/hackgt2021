import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key, required this.quantity, required this.increment})
      : super(key: key);

  final int quantity;
  final Function(int) increment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (quantity > 1) {
              increment(-1);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            quantity.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              increment(1);
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required void Function() press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
