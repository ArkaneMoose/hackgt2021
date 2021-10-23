import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final bool loading;
  final dynamic error;
  final void Function() signInWithGoogle;
  const Body({
    Key? key,
    this.loading = true,
    this.error,
    required this.signInWithGoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            child: Column(children: const [
              Text(
                'Welcome to',
                textScaleFactor: 2,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'POKT',
                textScaleFactor: 4,
                style: TextStyle(color: Colors.white),
              ),
            ]),
            padding: const EdgeInsets.only(bottom: 20.0)),
        !loading
            ? ElevatedButton(
                onPressed: signInWithGoogle,
                child: const Text('SIGN IN WITH GOOGLE'))
            : const ElevatedButton(
                onPressed: null,
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                  width: 20.0,
                  height: 20.0,
                ),
              ),
        error != null
            ? Text(error.toString(),
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center)
            : Container(),
      ],
    ));
  }
}
