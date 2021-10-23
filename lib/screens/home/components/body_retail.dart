import 'package:flutter/material.dart';
import 'package:hackgt2021/components/search_box.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/screens/home/components/discount_card_retail.dart';
import 'package:hackgt2021/screens/home/components/item_list.dart';
import 'package:hackgt2021/models/store.dart';

class BodyRetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          DiscountCardRetail(),
          ItemList(
              category: "Technology",
              stores: retail_tech,
              imgColor: kPrimaryColorRetail),
          ItemList(
              category: "General",
              stores: retail_general,
              imgColor: kPrimaryColorRetail),
          ItemList(
              category: "Home",
              stores: retail_home,
              imgColor: kPrimaryColorRetail),
        ],
      ),
    );
  }
}
