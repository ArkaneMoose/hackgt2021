import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackgt2021/constants.dart';

class TabButton {
  final Icon icon;
  final String label;
  const TabButton({required this.icon, required this.label});
}

const borderRadius = BorderRadius.only(
    topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0));

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> tabs;
  final TabController tabController;
  final int tabIndex;
  final Color primaryColor;

  BottomNavBar({
    Key? key,
    required Iterable<TabButton> tabs,
    required this.tabController,
    required this.tabIndex,
    required this.primaryColor,
  })  : tabs = tabs
            .map((tab) => BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.all(4.0), child: tab.icon),
                label: tab.label))
            .toList(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0.0, blurRadius: 2.0)
          ],
        ),
        child: ClipRRect(
            borderRadius: borderRadius,
            child: BottomNavigationBar(
              currentIndex: tabIndex,
              items: tabs,
              selectedItemColor: primaryColor,
              unselectedItemColor: kDarkPrimaryColor,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (tab) => tabController.animateTo(tab),
            )));
  }
}
