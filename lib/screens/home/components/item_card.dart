import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name, address, svgSrc, imgSrc;
  final Color imgColor;
  final void Function() press;
  const ItemCard({
    Key? key,
    required this.name,
    required this.address,
    required this.svgSrc,
    required this.imgSrc,
    required this.press,
    required this.imgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    // Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: imgColor.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  // child: Container(
                  //   height: 100,
                  //   width: 100,
                  //   child: Image.network(imgSrc),
                  // ),
                  child: CircleAvatar(
                    backgroundColor: imgColor.withOpacity(0.13),
                    radius: 50,
                    backgroundImage: NetworkImage(imgSrc),
                  ),
                ),
                Text(name),
                const SizedBox(height: 10),
                Text(
                  address,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
