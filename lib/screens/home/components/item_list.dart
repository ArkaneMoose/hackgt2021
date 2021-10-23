import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/models/store.dart';
import 'package:hackgt2021/screens/home/components/item_card.dart';
import 'package:hackgt2021/screens/storefront/storefront_screen.dart';

class ItemList extends StatelessWidget {
  final String category;
  final Color imgColor;
  final List<Store> stores;
  const ItemList(
      {Key? key,
      required this.category,
      required this.stores,
      required this.imgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                category,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kTextColor),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: stores
                      .map((s) => ItemCard(
                            imgColor: imgColor,
                            svgSrc: "assets/icons/burger_beer.svg",
                            imgSrc: s.imageUrl,
                            name: s.name,
                            address: s.address,
                            press: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return StorefrontScreen(s);
                                  },
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              )
            ]));
  }
}
