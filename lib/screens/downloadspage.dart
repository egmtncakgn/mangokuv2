import 'package:flutter/material.dart';
import '../styles/mstyles.dart';

class DownlandsPage extends StatelessWidget {
  const DownlandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            " İndirilenler Sayfası",
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
