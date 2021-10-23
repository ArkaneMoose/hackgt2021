import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hackgt2021/models/product.dart';
import '../../../models/cart.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  final List<dynamic> cart;
  const Body(this.cart, {Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart>? _cartItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    final resp = await Future.wait(widget.cart
        .map((element) => Product.fromId(element['productId']['value'])));
    setState(() {
      _cartItems = resp
          .asMap()
          .entries
          .map((e) => Cart(
              numOfItem: widget.cart[e.key]['quantity']['value'],
              product: e.value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cartItems == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: _cartItems!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(_cartItems![index].product.title.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cart.removeAt(index);
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8080),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: const [
                  Spacer(),
                  Icon(Ionicons.trash_outline, color: Colors.white),
                ],
              ),
            ),
            child: CartCard(cart: _cartItems![index]),
          ),
        ),
      ),
    );
  }
}
