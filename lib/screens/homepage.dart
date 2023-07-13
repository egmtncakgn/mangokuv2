// ignore: unused_import
// ignore_for_file: unused_element, unused_field
import 'package:flutter/material.dart';
import 'package:mangokuv2/screens/catagoriespage.dart';
import 'package:mangokuv2/screens/downloadspage.dart';
import 'package:mangokuv2/screens/favpage.dart';
import 'package:mangokuv2/screens/profilepage.dart';
import 'package:mangokuv2/screens/searchpage.dart';
import 'package:mangokuv2/styles/mcolors.dart';
import 'package:mangokuv2/widgets/widgets.dart';

import '../models/navbar.dart';

class HomePage extends StatefulWidget {
  static String id = "/HomePage";
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 5;

  final _pages = [
    const Body(),
    const SearchPage(),
    const CatagoriesPage(),
    const FavPage(),
    const DownlandsPage(),
    const ProfilePage()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

// Trendler yüklenmiyor ya listener kur statefull yap yada eşitlenmesini bekle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: _pages,
      ),
      bottomNavigationBar: newNavBar(),
    );
  }

  Container newNavBar() {
    return Container(
        height: kBottomNavigationBarHeight * 1.23,
        decoration: BoxDecoration(color: Mcolors.background, boxShadow: [
          BoxShadow(
              color: Mcolors.cyan.withOpacity(.45),
              spreadRadius: 5,
              blurRadius: 15),
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BottomNavigationBar(
            currentIndex: _selectedTab,
            backgroundColor: Mcolors.background,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Mcolors.cyan,
            iconSize: 28,
            onTap: (value) => _changeTab(value),
            type: BottomNavigationBarType.fixed,
            items: itemsNavBar));
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [Header(), Trends(), Recents(), Aviable()],
      ),
    );
  }
}
