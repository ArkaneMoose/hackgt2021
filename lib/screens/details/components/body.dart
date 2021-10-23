import 'package:flutter/material.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/models/product.dart';

import 'add_to_cart.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = 1;
  }

  void _increment(int inc) {
    setState(() {
      _quantity += inc;
    });
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: kDefaultPaddin / 2),
                      Description(product: widget.product),
                      const SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(
                          quantity: _quantity, increment: _increment),
                      const SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: widget.product, quantity: _quantity)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: widget.product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
