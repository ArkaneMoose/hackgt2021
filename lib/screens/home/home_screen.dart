import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hackgt2021/auth.dart';
import 'package:hackgt2021/components/app_bar_food.dart';
import 'package:hackgt2021/components/app_bar_grocery.dart';
import 'package:hackgt2021/components/app_bar_retail.dart';
import 'package:hackgt2021/components/app_bar_profile.dart';
import 'package:hackgt2021/components/bottom_nav_bar.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/screens/home/components/body_food.dart';
import 'package:hackgt2021/screens/home/components/body_grocery.dart';
import 'package:hackgt2021/screens/home/components/body_retail.dart';
import 'package:hackgt2021/screens/profile/profile_screen.dart';

final List<_Tab> tabs = [
  _Tab(
    tab: const TabButton(
      icon: Icon(Ionicons.fast_food_outline),
      label: 'Food',
    ),
    child: BodyFood(),
    primaryColor: kPrimaryColorFood,
    appBar: foodAppBar,
  ),
  _Tab(
    tab: const TabButton(
      icon: Icon(Ionicons.basket_outline),
      label: 'Grocery',
    ),
    child: BodyGrocery(),
    primaryColor: kPrimaryColorGrocery,
    appBar: groceryAppBar,
  ),
  _Tab(
    tab: const TabButton(
      icon: Icon(Ionicons.pricetag_outline),
      label: 'Retail',
    ),
    child: BodyRetail(),
    primaryColor: kPrimaryColorRetail,
    appBar: retailAppBar,
  ),
  const _Tab(
    tab: TabButton(
      icon: Icon(Ionicons.person_outline),
      label: 'Profile',
    ),
    child: ProfileScreen(),
    primaryColor: kPrimaryColorFood,
    appBar: profileAppBar,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _tabIndex;
  final List<TabButton> _navBarTabs = tabs.map((tab) => tab.tab).toList();
  final List<Widget> _tabViews = tabs.map((tab) => tab.child).toList();

  _HomeScreenState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabIndex = _tabController.index;
  }

  @override
  void initState() {
    super.initState();
    _tabIndex = _tabController.index;
    _tabController.animation?.addListener(onTabControllerChange);
  }

  @override
  void dispose() {
    _tabController.animation?.removeListener(onTabControllerChange);
    _tabController.dispose();
    super.dispose();
  }

  void onTabControllerChange() {
    final newTabIndex = _tabController.index;
    if (newTabIndex != _tabIndex) {
      setState(() {
        _tabIndex = newTabIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tab = tabs[_tabIndex];
    return AuthGate(
      child: Scaffold(
        appBar: tab.appBar != null ? tab.appBar(context) : null,
        bottomNavigationBar: BottomNavBar(
          tabs: _navBarTabs,
          tabController: _tabController,
          tabIndex: _tabIndex,
          primaryColor: tab.primaryColor,
        ),
        body: TabBarView(
          children: _tabViews,
          controller: _tabController,
        ),
      ),
    );
  }
}

class _Tab {
  final TabButton tab;
  final AppBar Function(BuildContext) appBar;
  final Color primaryColor;
  final Widget child;
  const _Tab(
      {required this.tab,
      required this.appBar,
      required this.primaryColor,
      required this.child});
}
