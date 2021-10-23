import 'package:flutter/material.dart';
import 'package:hackgt2021/models/product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          SizedBox(
            height: 200,
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "Price\n"),
                      TextSpan(
                        text: "\$${product.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: kDefaultPaddin),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                        tag: "${product.id}",
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: kDefaultPaddin * 2),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
