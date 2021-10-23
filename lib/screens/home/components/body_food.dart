import 'package:flutter/material.dart';
import 'package:hackgt2021/components/search_box.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/screens/home/components/discount_card_food.dart';
import 'package:hackgt2021/screens/home/components/item_list.dart';
import 'package:hackgt2021/models/store.dart';

class BodyFood extends StatelessWidget {
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
              category: "Fast Food",
              stores: food_sitdine,
              imgColor: kPrimaryColorFood),
          DiscountCardFood(),
          ItemList(
              category: "Fine Dining",
              stores: food_fast,
              imgColor: kPrimaryColorFood),
          ItemList(
              category: "Fresh Orangutan",
              stores: food_delivery,
              imgColor: kPrimaryColorFood),
        ],
      ),
    );
  }
}
