import 'package:flutter/foundation.dart';

class CoinsModel extends ChangeNotifier {
  int _coins = 0;

  int get coins => _coins;

  void addCoins(int coins) {
    _coins += coins;
    notifyListeners();
  }

  void removeCoins(int coins) {
    _coins -= coins;
    notifyListeners();
  }
}
