// import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:retail_io/screens/login/login_screen.dart';
import 'package:retail_io/transitions.dart';

class AuthGate extends StatefulWidget {
  final Widget child;
  const AuthGate({Key? key, required this.child}) : super(key: key);

  @override
  _AuthGatedStatelessWidgetState createState() =>
      _AuthGatedStatelessWidgetState();
}

class _AuthGatedStatelessWidgetState extends State<AuthGate> {
  Widget _widget = Container();
  // StreamSubscription<User?>? _subscription;
  bool _pushedLoginScreen = false;
  bool _loggedIn = false;

  _AuthGatedStatelessWidgetState();

  @override
  void didUpdateWidget(covariant AuthGate oldWidget) {
    super.didUpdateWidget(oldWidget);
    _widget = widget.child;
  }

  @override
  void initState() {
    super.initState();
    _pushedLoginScreen = false;
    _loggedIn = true;
    // _loggedIn = FirebaseAuth.instance.currentUser != null;
    // _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
    //   bool loggedIn = (user != null);
    //   setState(() {
    //     _loggedIn = loggedIn;
    //   });
    //   if (!loggedIn && !_pushedLoginScreen) {
    _pushedLoginScreen = true;
    // Navigator.push(
    //   context,
    //   FadePageRoute(builder: (context) => const LoginScreen()),
    // ).whenComplete(() {
    //   _pushedLoginScreen = false;
    //   setState(() {
    //     _loggedIn = true;
    //   });
    // });
    //   }
    // });
    _widget = widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    // _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loggedIn) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return _widget;
  }
}

// Future<UserCredential?> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Return if sign-in cancelled
//   if (googleUser == null) {
//     return null;
//   }

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   // Create a new credential
//   final OAuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

// Future<void> signOut() async {
//   await FirebaseAuth.instance.signOut();
//   await GoogleSignIn().signOut();
// }
