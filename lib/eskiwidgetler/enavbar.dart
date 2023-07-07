import 'package:flutter/material.dart';

import '../models/navbar.dart';
import '../styles/mcolors.dart';

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
                                    itemsNavBar[index].icon as IconData?,
                                    color: (index == value)
                                        ? Mcolors.cyan
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    // Burayı düzelt items navbardaki text widgeti yüzünden hata veriyor

                                    "itemsNavBar[index].label",
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
