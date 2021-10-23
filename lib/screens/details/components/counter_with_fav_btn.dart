import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key? key,
    required this.quantity,
    required this.increment,
  }) : super(key: key);

  final int quantity;
  final Function(int) increment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(quantity: quantity, increment: increment),
      ],
    );
  }
}
