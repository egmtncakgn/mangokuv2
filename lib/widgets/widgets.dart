// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangokuv2/helpers/firebasedb.dart';
import 'package:mangokuv2/models/seri.dart';
import 'package:mangokuv2/screens/detailpage.dart';
import 'package:mangokuv2/styles/mcolors.dart';
import 'package:mangokuv2/models/manga.dart';
import 'package:mangokuv2/styles/mstyles.dart';
import 'package:mangokuv2/helpers/silver_custom_header.dart';

void goToDetail(BuildContext context, Seri seri) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: ((context) => DetailPage(
                seri: seri,
              ))));
}

// Alt nav bar için boşluk
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
              child:
                  Text("Ön İzleme: One Punch Man", style: Mstyles().h1TxStyle),
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
          aspectRatio: 16 / 8,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Text("Yakın Zamanda Eklenenler", style: Mstyles().h1TxStyle),
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
// Eleman resim oranlarında bir hata var düzelt onepuncman daha ince uzun görünüyor
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
          padding: const EdgeInsets.only(right: 0, bottom: 5),
          // Tıklanabilirlik özelliği için outlinedbuttona wrap edildi
          child: SizedBox(
            // Yakın zamanda eklenenler listesi eleman büyüklükleri buradan ayarlanıyor
            height: constraints.maxHeight * .70,
            width: constraints.maxWidth * .29,
            child: OutlinedButton(
              onPressed: () {
                //goToDetail(context, );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  recentData[index].poster,
                  fit: BoxFit.fill,
                ),
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
class Trends extends StatefulWidget {
  const Trends({
    Key? key,
  }) : super(key: key);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
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
class ListTrends extends StatefulWidget {
  const ListTrends({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTrends> createState() => _ListTrendsState();
}

class _ListTrendsState extends State<ListTrends> {
  @override
  Widget build(BuildContext context) {
    return const ListTrendsBuilder();
  }
}

class ListTrendsBuilder extends StatefulWidget {
  const ListTrendsBuilder({
    super.key,
  });

  @override
  State<ListTrendsBuilder> createState() => _ListTrendsBuilderState();
}

class _ListTrendsBuilderState extends State<ListTrendsBuilder> {
  @override
  Widget build(BuildContext context) {
    List<Seri> seriler = List.empty();
    final db = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection("seriler").snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Bi Sorun Var ${snapshot.hasError}"),
              );
            } else {
              seriler = FFHelper().serileriListele(snapshot.data);
              return Expanded(child: LayoutBuilder(builder: (_, constraints) {
                return ListView.builder(
                    itemCount: seriler.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 5, left: 20),
                    itemBuilder: (_, index) {
                      final seri = seriler[index];
                      final style = Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600);
                      return TrendsItem(
                        seri: seri,
                        style: style,
                        constraints: constraints,
                      );
                    });
              }));
            }
        }
      },
    );
  }
}

// Trendler Liste Elemanları
class TrendsItem extends StatelessWidget {
  const TrendsItem(
      {super.key,
      required this.seri,
      required this.style,
      required this.constraints});
  final BoxConstraints constraints;
  final Seri seri;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth * .375,
        child: OutlinedButton(
          onPressed: () {
            // Üzerine tıklanıldığında detailpage açılıyor.
            goToDetail(context, seri);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  seri.posterAddress,
                  fit: BoxFit.cover,
                ),
              )),
              const SizedBox(height: 15),
              Text(
                seri.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7.5),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Text("Puan: ${seri.score}", style: style),
                  const SizedBox(
                    width: 7.5,
                  ),
                  Text("# ${seri.rank}",
                      style: style?.copyWith(color: Mcolors.cyan)),
                ],
              )
            ],
          ),
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
          style: Mstyles().h1TxStyle,
        )),
        TextButton(
            onPressed: () {},
            child: Text("Hepsini Gör", style: Mstyles().m1TxStyle))
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
/*
// burası sıçtı düzelt
class BestOf extends StatelessWidget {
  const BestOf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Bugünün En İyileri", style: Mstyles().h1TxStyle),
            ),
            Column(
              children: ListView.builder(
          itemCount: trendsData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    trendsData[index].name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      trendsData[index].name[0],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Text("\$ ${trendsData[index].number"),
                ),
              ),
            );
          },
      ])  ),
  }
}*/