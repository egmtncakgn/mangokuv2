import 'package:flutter/material.dart';
import 'package:mangokuv2/models/manga.dart';
import 'package:mangokuv2/styles/mstyles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.manga});
  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Center(
          child: Text(
            manga.name,
            style: Mstyles().m1TxStyle,
          ),
        )),
      ),
    );
  }
}
