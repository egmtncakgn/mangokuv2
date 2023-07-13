import 'package:flutter/material.dart';
import '../styles/mstyles.dart';

class CatagoriesPage extends StatelessWidget {
  const CatagoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            "Katagoriler Sayfası",
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
