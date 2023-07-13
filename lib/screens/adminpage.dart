import 'package:flutter/material.dart';
import 'package:mangokuv2/styles/mstyles.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Adminpage",
        style: Mstyles().h1TxStyle,
      ),
    ));
  }
}
