//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retail_io/auth.dart';
import 'package:retail_io/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthGate(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          leading: const SizedBox(),
          elevation: 0,
          title: const Text("retail.io"),
          actions: <Widget>[
            Row(
              children: const [
                Icon(Icons.monetization_on),
                SizedBox(width: kDefaultPadding / 4),
                Text("100", style: TextStyle(fontSize: 20)),
                SizedBox(width: kDefaultPadding / 2),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF961F).withOpacity(0.7),
                          const Color(0xFFFFC61F).withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SCAVENGER HUNT",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(text: "Find "),
                                      TextSpan(
                                          text: "Bush's Baked Beans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Reward:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: " "),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.monetization_on,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      TextSpan(text: " 100"),
                                    ],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF961F).withOpacity(0.7),
                          const Color(0xFFFFC61F).withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Image.asset(
                              "assets/products/chips.jpg",
                              width: 80,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SCAVENGER HUNT",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(text: "Find "),
                                      TextSpan(
                                          text: "Bush's Baked Beans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Reward:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: " "),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.monetization_on,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      TextSpan(text: " 100"),
                                    ],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF961F).withOpacity(0.7),
                          const Color(0xFFFFC61F).withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SCAVENGER HUNT",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(text: "Find "),
                                      TextSpan(
                                          text: "Bush's Baked Beans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Reward:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: " "),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.monetization_on,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      TextSpan(text: " 100"),
                                    ],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFF961F).withOpacity(0.7),
                          const Color(0xFFFFC61F).withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SCAVENGER HUNT",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(text: "Find "),
                                      TextSpan(
                                          text: "Bush's Baked Beans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Reward:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: " "),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.monetization_on,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      TextSpan(text: " 100"),
                                    ],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
