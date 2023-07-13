import 'package:flutter/material.dart';
import '../styles/mstyles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            "Arama Sayfası",
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
