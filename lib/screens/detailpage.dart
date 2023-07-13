import 'package:flutter/material.dart';
import 'package:mangokuv2/models/seri.dart';
import 'package:mangokuv2/styles/mstyles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.seri});
  final Seri seri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            seri.name,
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
