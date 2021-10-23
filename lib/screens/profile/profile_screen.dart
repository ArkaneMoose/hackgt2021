import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:hackgt2021/auth.dart';
import 'package:hackgt2021/constants.dart';
import 'package:hackgt2021/screens/profile/components/profile_list_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _email;
  String? _profilePic;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    setStateFromFirebase();
    _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        setStateFromFirebase();
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void setStateFromFirebase() {
    _name = FirebaseAuth.instance.currentUser?.displayName;
    _email = FirebaseAuth.instance.currentUser?.email;
    _profilePic = FirebaseAuth.instance.currentUser?.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(const BoxConstraints(), designSize: const Size(414, 896));

    var profileInfo = Column(
      children: <Widget>[
        SizedBox(height: kSpacingUnit.w * 3),
        SizedBox(
          height: kSpacingUnit.w * 10,
          width: kSpacingUnit.w * 10,
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: kPrimaryColorFood.withOpacity(0.5),
                radius: kSpacingUnit.w * 5,
                backgroundImage:
                    _profilePic != null ? NetworkImage(_profilePic!) : null,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: kSpacingUnit.w * 2.5,
                  width: kSpacingUnit.w * 2.5,
                  decoration: const BoxDecoration(
                    color: kPrimaryColorFood,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    heightFactor: kSpacingUnit.w * 1.5,
                    widthFactor: kSpacingUnit.w * 1.5,
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: kDarkPrimaryColor,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kSpacingUnit.w * 2),
        Text(
          _name ?? "",
          style: kTitleTextStyle,
        ),
        SizedBox(height: kSpacingUnit.w * 0.5),
        Text(
          _email ?? "",
          style: kCaptionTextStyle,
        ),
        SizedBox(height: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          profileInfo,
          Expanded(
            child: ListView(
              children: const <Widget>[
                ProfileListItem(
                  icon: Ionicons.shield_outline,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: Ionicons.time_outline,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: Ionicons.help_outline,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: Ionicons.settings_outline,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: Ionicons.person_add_outline,
                  text: 'Invite a Friend',
                ),
                ProfileListItem(
                  icon: Ionicons.log_out_outline,
                  text: 'Logout',
                  hasNavigation: false,
                  onTap: signOut,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
