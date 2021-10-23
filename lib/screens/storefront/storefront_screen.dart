import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hackgt2021/api/ncr.dart';
import 'package:hackgt2021/auth.dart';
import 'package:hackgt2021/components/fab_barcode_scan.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/models/store.dart';
import 'package:hackgt2021/screens/details/details_screen.dart';
import 'package:hackgt2021/screens/storefront/components/body.dart';
import 'package:hackgt2021/screens/cart/cart_screen.dart';
import 'package:hackgt2021/models/product.dart';

class StorefrontScreen extends StatelessWidget {
  final Store store;
  const StorefrontScreen(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
      child: Scaffold(
        floatingActionButton: store.type != 'food'
            ? FabBarcodeScan(
                onBarcodeScanned: (result) async {
                  final response = await Ncr.get(
                      'https://gateway-staging.ncrcloud.com/catalog/items/?packageIdentifierPattern=${result.rawContent}');
                  final pageContent = response['pageContent'] as List<dynamic>;
                  if (pageContent.isEmpty) {
                    return;
                  }

                  final entry = pageContent[0];
                  final id = entry['itemId']['itemCode'] as String;
                  final product = await Product.fromId(id);

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DetailsScreen(
                          product: product,
                        ),
                      ));
                },
              )
            : null,
        appBar: buildAppBar(context),
        body: Body(store),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Ionicons.search_outline, color: kDarkPrimaryColor),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Ionicons.cart_outline, color: kDarkPrimaryColor),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return CartScreen();
                },
              ),
            );
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
