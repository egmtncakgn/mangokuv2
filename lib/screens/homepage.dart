// ignore: unused_import
// ignore_for_file: unused_element, unused_field

import 'package:flutter/material.dart';
import 'package:mangokuv2/screens/catagoriespage.dart';
import 'package:mangokuv2/screens/downloadspage.dart';
import 'package:mangokuv2/screens/favpage.dart';
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
  int _selectedTab = 0;

  final List _pages = [
    const Body(),
    const SearchPage(),
    const CatagoriesPage(),
    const FavPage(),
    const DownlandsPage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_pages[_selectedTab], NavBar()],
    ));
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: kBottomNavigationBarHeight * 1.22,
          decoration: BoxDecoration(color: Mcolors.background, boxShadow: [
            BoxShadow(
                color: Mcolors.cyan.withOpacity(.45),
                spreadRadius: 7.5,
                blurRadius: 15),
          ]),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: List.generate(
                itemsNavBar.length,
                ((index) => Expanded(
                    child: ValueListenableBuilder<int>(
                        valueListenable: _index,
                        builder: (_, value, __) {
                          return GestureDetector(
                            // Alt tuşlara basıldığında
                            onTap: () => _index.value = index,
                            child: Material(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    itemsNavBar[index].icon,
                                    color: (index == value)
                                        ? Mcolors.cyan
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    itemsNavBar[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: (index == value)
                                              ? Mcolors.cyan
                                              : Colors.grey,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })))),
          ),
        ));
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [Header(), Trends(), Recents(), Aviable(), BottomSpace()],
      ),
    );
  }
}
