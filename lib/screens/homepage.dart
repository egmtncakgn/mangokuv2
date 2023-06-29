// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mangokuv2/styles/mcolors.dart';
import 'package:mangokuv2/widgets/widgets.dart';

import '../models/navbar.dart';

class HomePage extends StatelessWidget {
  static String id = "/Homepage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [const Body(), NavBar()],
    )));
  }
}

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
  }) : super(key: key);

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
    return const CustomScrollView(
      slivers: [Header(), Trends(), Recents(), Aviable(), BottomSpace()],
    );
  }
}
