import 'package:flutter/material.dart';
import 'package:mangokuv2/models/mcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangokuv2/models/anime.dart';
import 'package:mangokuv2/models/mstyles.dart';
import 'package:mangokuv2/models/silver_custom_header.dart';

class BottomSpace extends StatelessWidget {
  /// Alttan belirli bir miktarda boşluk bırakmak için yazıldı
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
            // Ön izleme alanı başlık kodları
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Ön İzleme: One Punch Man",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            // Ön izleme alanı içerik kodları
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

// Yakın Zamanda Eklenenler Sekmesi
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
          aspectRatio: 16 / 7,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Text("Yakın Zamanda Eklenenler", style: Mstyles().H1TxStyle),
            ),
            const ListRecents()
          ]),
        ),
      ),
    );
  }
}

// Yakın Zamanda Eklenenler Sekmesinin Liste Item Oluşturucusu
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
              return RecentsItems(
                index: index,
                constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}

// Yakın Zamanda Eklenenler Sekmesi Liste Elemanları
class RecentsItems extends StatelessWidget {
  final int index;
  final BoxConstraints constraints;

  const RecentsItems(
      {super.key, required this.index, required this.constraints});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          // Elemanlar arası boşlukların ayarlandığı yer
          padding: const EdgeInsets.only(right: 10, bottom: 5),
          child: SizedBox(
            // Yakın zamanda eklenenler listesi eleman büyüklükleri buradan ayarlanıyor
            height: constraints.maxHeight * .78,
            width: constraints.maxWidth * .25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                recentData[index].poster,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          recentData[index].name,
          style: Mstyles().rcTxStyle,
        )
      ],
    );
  }
}

// Trendler Sekmesi
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

// Trendler Sekmesi Liste Oluşturucusu
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
            return TrendsItem(
              manga: manga,
              style: style,
              constraints: constraints,
            );
          });
    }));
  }
}

// Trendler Liste Elemanları
class TrendsItem extends StatelessWidget {
  const TrendsItem(
      {super.key,
      required this.manga,
      required this.style,
      required this.constraints});
  final BoxConstraints constraints;
  final Manga manga;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
  }
}

// Trendler başlığı
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
          style: Mstyles().H1TxStyle,
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

// Sayfanın en üstü app bar
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
