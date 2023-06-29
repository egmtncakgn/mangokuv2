// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:mangokuv2/models/mcolors.dart';
import 'package:mangokuv2/models/mstyles.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/a.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                LoginHeaderTx(),
                SizedBox(
                  height: 150,
                ),
                SignInButton(Buttons.FacebookNew, onPressed: () {}),
                SignInButton(Buttons.Google, onPressed: () {}),
                SignInButton(Buttons.Apple, onPressed: () {}),
                SignInButton(Buttons.Email, onPressed: () {}),
              ]),
            ))
      ],
    );
  }
}

class LoginHeaderTx extends StatelessWidget {
  const LoginHeaderTx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
        child: Text(
          "MANGOKU",
          style: Mstyles().lgnStyle,
        ),
      ),
    );
  }
}
