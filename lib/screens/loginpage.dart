// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangokuv2/helpers/google_sign_in.dart';
//import 'package:mangokuv2/models/mcolors.dart';
import 'package:mangokuv2/styles/mstyles.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mangokuv2/screens/homepage.dart';
import 'package:provider/provider.dart';

// firebase login henüz eklenmedi düz diğer sayfaya bağlandı butonlar.
// Giriş yapılıp yapılmadığını kontrol edip direk ana sayfaya yönlendirmesi gerek
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "/Loginpage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const Homepage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Ops bişey patladı galiba"),
            );
          } else {
            return const Stack(
              children: [ArkaPlanResim(), Page()],
            );
          }
        });
  }
}

class Page extends StatefulWidget {
  const Page({
    super.key,
  });

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            LoginHeaderTx(),
            SizedBox(
              height: 150,
            ),
            SignInButton(Buttons.Google, onPressed: () {
              final provider =
                  Provider.of<GSignInProvider>(context, listen: false);
              provider.googleLogin();
            }),
          ]),
        ));
  }
}

class ArkaPlanResim extends StatelessWidget {
  const ArkaPlanResim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/b.jpg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
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
          "Mangoku",
          style: Mstyles().lgnStyle,
        ),
      ),
    );
  }
}
