import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgt2021/api/ncr.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackgt2021/models/product.dart';
import 'package:hackgt2021/screens/cart/cart_screen.dart';

import '../../../constants.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final int quantity;
  final Product product;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool _addingToCart = false;

  @override
  void initState() {
    super.initState();
    _addingToCart = false;
  }

  void addToCart() async {
    setState(() {
      _addingToCart = true;
    });

    try {
      final orderInfoDoc = FirebaseFirestore.instance
          .collection('orders')
          .doc(FirebaseAuth.instance.currentUser?.uid);
      final orderInfo = await orderInfoDoc.get();
      String? orderId;

      List<dynamic>? orderLines = [];
      if (!orderInfo.exists) {
        final created = await Ncr.post(
            'https://gateway-staging.ncrcloud.com/order/3/orders/1',
            body: {});
        await orderInfoDoc.set({'id': created['id']});
      } else {
        orderId = orderInfo.data()?['id'];
        if (orderId != null) {
          final response = (await Ncr.get(
              'https://gateway-staging.ncrcloud.com/order/3/orders/1/$orderId'));
          orderLines = response['orderLines'];
        }
      }

      var index = -1;
      if (orderLines != null) {
        index = orderLines.indexWhere((element) =>
            element['productId']['value'] == widget.product.id.toString());
      } else {
        orderLines = [];
      }
      if (index == -1) {
        orderLines.add({
          'productId': {
            'type': 'id',
            'value': widget.product.id,
          },
          'quantity': {
            'unitOfMeasure': 'EA',
            'unitOfMeasureLabel': 'each',
            'value': widget.quantity,
          },
          'unitPrice': widget.product.price,
        });
      } else {
        orderLines[index]['quantity']['value'] += widget.quantity;
        orderLines[index]['unitPrice'] = widget.product.price;
      }
      print(await Ncr.patch(
          'https://gateway-staging.ncrcloud.com/order/3/orders/1/$orderId',
          body: {
            'orderLines': orderLines,
          }));

      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => const CartScreen()));
    } catch (e) {
      print(e);
      setState(() {
        _addingToCart = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  primary: widget.product.color,
                ),
                onPressed: !_addingToCart ? addToCart : null,
                child: !_addingToCart
                    ? Text(
                        "Add  To  Cart".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                        width: 20.0,
                        height: 20.0,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
