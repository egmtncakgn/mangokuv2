import 'package:flutter/material.dart';

class NavBar {
  final IconData icon;
  final String name;

  const NavBar({required this.name, required this.icon});
}

const itemsNavBar = [
  NavBar(name: "Ana Sayfa", icon: Icons.home),
  NavBar(name: "Arama", icon: Icons.search),
  NavBar(name: "Favoriler", icon: Icons.favorite),
  NavBar(name: "İndirilenler", icon: Icons.arrow_circle_down_sharp),
];
