import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackgt2021/api/ncr.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<dynamic>? _cart;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final orderInfoDoc = FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    final orderInfo = await orderInfoDoc.get();
    String? orderId;
    print(1);

    if (!orderInfo.exists) {
      setState(() {
        _cart = [];
      });
      return;
    }
    print(2);

    orderId = orderInfo.data()?['id'];

    if (orderId != null) {
      final response = (await Ncr.get(
          'https://gateway-staging.ncrcloud.com/order/3/orders/1/$orderId'));
      print(3);
      print(response);
      if (response['orderLines'] != null) {
        setState(() {
          _cart = response['orderLines'];
        });
        print(4);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(5);
    if (_cart == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    var total = 0.0;
    _cart?.forEach((element) {
      total += element['unitPrice'] * element['quantity']['value'];
    });

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(_cart ?? []),
      bottomNavigationBar: CheckoutCard(total),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    int numItems = 0;
    _cart?.forEach((element) {
      numItems += element['quantity']['value'] as int;
    });
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "$numItems items",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
