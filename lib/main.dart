import 'package:flutter/material.dart';
import 'package:retail_io/models/coins.dart';
import 'package:retail_io/screens/home/bestbuy.dart';
import 'package:retail_io/screens/home/publix.dart';
import 'package:retail_io/screens/home/redeem_rewards.dart';
import 'package:retail_io/screens/home/stores.dart';
import 'package:retail_io/screens/home/target.dart';
import 'package:retail_io/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoinsModel(),
      child: MaterialApp(
        title: 'retail.io',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
