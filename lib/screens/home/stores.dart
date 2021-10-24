//import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:retail_io/components/app_bar.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/screens/home/bestbuy.dart';
import 'package:retail_io/screens/home/publix.dart';
import 'package:retail_io/screens/home/target.dart';

import 'components/store_item.dart';

class Stores extends StatelessWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
        child: Scaffold(
            backgroundColor: Colors.lightGreen.shade100,
            appBar: AppBar(),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StoreItem(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.lightGreen,
                              ],
                            ),
                            imagePath: "assets/products/publix.png",
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return const Publix();
                              }));
                            },
                          ),
                          StoreItem(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.lightGreen,
                              ],
                            ),
                            imagePath: "assets/products/target.png",
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return const Target();
                              }));
                            },
                          ),
                          StoreItem(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.lightGreen,
                              ],
                            ),
                            imagePath: "assets/products/bestbuy.png",
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return const BestBuy();
                              }));
                            },
                          )
                        ])))));
  }
}
