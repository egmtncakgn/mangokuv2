import 'package:flutter/material.dart';
import 'package:mangokuv2/models/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangokuv2/models/anime.dart';
import 'package:mangokuv2/models/navbar.dart';
import 'package:mangokuv2/models/silver_custom_header.dart';

//
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

class BottomSpace extends StatelessWidget {
  const BottomSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SliverToBoxAdapter(
      child: const SizedBox(
        height: kBottomNavigationBarHeight * 1.4,
      ),
    );
  }
}

class Aviable extends StatelessWidget {
  const Aviable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Ön İzleme: One Punch Man",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.network(
                    "https://i4.hurimg.com/i/hurriyet/75/750x422/614efc6f4e3fe11c700190f7.jpg",
                    fit: BoxFit.fitWidth,
                  )),
                  // Ön izleme bölümündeki resimin üzerine ikon ekler (Gereksiz)
                  /*Align(
                      child: SvgPicture.asset(
                    "icons/a.svg",
                    width: 80,
                  ))*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 16 / 6,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Yakın Zamanda Eklenenler",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const ListRecents()
          ]),
        ),
      ),
    );
  }
}

class ListRecents extends StatelessWidget {
  const ListRecents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ListView.builder(
            itemCount: recentData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, top: 10),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      recentData[index].poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: Column(children: [HeaderTrends(), ListTrends()]),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(builder: (_, constraints) {
      return ListView.builder(
          itemCount: trendsData.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, left: 20),
          itemBuilder: (_, index) {
            final manga = trendsData[index];
            final style = Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600);
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth * .375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        manga.poster,
                        fit: BoxFit.cover,
                      ),
                    )),
                    const SizedBox(height: 15),
                    Text(
                      manga.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7.5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "icons/a.svg",
                        ),
                        const SizedBox(width: 5),
                        Text("Puan: ${manga.score}", style: style),
                        const SizedBox(
                          width: 7.5,
                        ),
                        Text("# ${manga.number}",
                            style: style?.copyWith(color: Mcolors.cyan)),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }));
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
            child: Text(
          "Trendler",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        Text("Hepsini Gör",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Mcolors.cyan, fontWeight: FontWeight.w700))
      ]),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SilverCustomHeaderDelegate(
          maxHeight: 60,
          minHeight: 60,
          child: Container(
            color: Mcolors.background,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Mangoku",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Mcolors.cyan),
                    )),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text("Bugün ne okumak istersiniz?",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white)),
              ],
            ),
          )),
    );
  }
}
