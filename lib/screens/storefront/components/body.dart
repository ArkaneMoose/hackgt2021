import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgt2021/api/ncr.dart';
import 'package:hackgt2021/models/product.dart';
import 'package:hackgt2021/models/store.dart';
import 'package:hackgt2021/screens/storefront/components/store_card.dart';
import 'package:hackgt2021/screens/storefront/components/item_list.dart';

class Body extends StatefulWidget {
  final Store store;
  const Body(this.store, {Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Store _store = Store(
      name: "",
      address: "",
      imageUrl: "",
      description: "",
      color: Colors.white,
      type: "");
  List<Product>? _products;
  _BodyState();

  @override
  void initState() {
    super.initState();
    callApi();
    _store = widget.store;
  }

  void callApi() async {
    final response = await Ncr.get(
        'https://gateway-staging.ncrcloud.com/catalog/items/?packageIdentifierPattern=${_store.type}');
    final products = await Future.wait(
        (response['pageContent'] as List<dynamic>).map((entry) {
      final id = entry['itemId']['itemCode'] as String;
      return Product.fromId(id);
    }));
    setState(() {
      _products = products;
    });
  }

  @override
  void didUpdateWidget(covariant Body oldWidget) {
    super.didUpdateWidget(oldWidget);
    _store = widget.store;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StoreCard(store: _store),
          // Container(
          //   margin: EdgeInsets.only(bottom: size.height * 0.03),
          //   padding: EdgeInsets.only(
          //     top: size.height * 0.25,
          //     left: kDefaultPaddin,
          //     right: kDefaultPaddin,
          //   ),
          //   // height: 500,
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(24),
          //       bottomRight: Radius.circular(24),
          //     ),
          //   ),
          // ),
          _products != null
              ? ItemList(
                  category: "",
                  items: _products!.take(_products!.length ~/ 3).toList())
              : const Center(child: CircularProgressIndicator()),
          _products != null
              ? ItemList(
                  category: "",
                  items: _products!
                      .skip(_products!.length ~/ 3)
                      .take(_products!.length ~/ 3)
                      .toList())
              : Container(),
          _products != null
              ? ItemList(
                  category: "",
                  items: _products!.skip(2 * (_products!.length ~/ 3)).toList())
              : Container(),
        ],
      ),
    );
  }
}
