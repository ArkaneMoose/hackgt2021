import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackgt2021/auth.dart';
import 'package:hackgt2021/screens/login/components/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = true;
  dynamic _error;
  StreamSubscription<User?>? _subscription;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _error = null;
    _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Body(
              loading: _loading,
              error: _error,
              signInWithGoogle: _signInWithGoogle),
        ),
      );

  Future<void> _signInWithGoogle() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await signInWithGoogle();
    } catch (error) {
      setState(() {
        _error = error;
      });
    }
    setState(() {
      _loading = false;
    });
  }
}
