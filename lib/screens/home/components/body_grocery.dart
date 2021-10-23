import 'package:flutter/material.dart';
import 'package:hackgt2021/components/search_box.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/screens/home/components/discount_card_grocery.dart';
import 'package:hackgt2021/screens/home/components/item_list.dart';
import 'package:hackgt2021/models/store.dart';

class BodyGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          ItemList(
              category: "Most Popular",
              stores: grocery_mp,
              imgColor: kPrimaryColorGrocery),
          ItemList(
              category: "Wholesale",
              stores: grocery_wholesale,
              imgColor: kPrimaryColorGrocery),
          DiscountCardGrocery(),
          ItemList(
              category: "International",
              stores: grocery_int,
              imgColor: kPrimaryColorGrocery),
        ],
      ),
    );
  }
}
