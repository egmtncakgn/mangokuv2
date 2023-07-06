import 'package:flutter/material.dart';
import '../styles/mstyles.dart';
import '../models/navbar.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key, this.bar});
  final NavBar? bar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            bar!.name,
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}