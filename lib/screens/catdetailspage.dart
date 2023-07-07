import 'package:flutter/material.dart';
import '../styles/mstyles.dart';

class CatDetailsPage extends StatelessWidget {
  const CatDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            "bar.name",
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
