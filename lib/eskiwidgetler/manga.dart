class Manga {
  final int id;
  final String name;
  final double score;
  final int number;
  final String poster;
  const Manga(
      {required this.id,
      required this.name,
      required this.score,
      required this.number,
      required this.poster});
}

// number datası 3 basamaktan fazla olursa pixel overflow hatası veriyor
const trendsData = [
  Manga(
      name: "Kadim Cerrah",
      score: 5,
      number: 125,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2022/03/kadimcerrah.jpg",
      id: 1),
  Manga(
      name: "One Punch Man",
      score: 9,
      number: 165,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2021/07/12c1fa13-1c8d-422e-ae4f-365c29e88076.jpg",
      id: 2),
  Manga(
      name: "8.Sınıf Büyücü",
      score: 7.5,
      number: 15,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2021/07/sinifbuyucuyen.jpg",
      id: 3),
];

const recentData = [
  Manga(
      name: "Kadim Cerrah",
      score: 5,
      number: 125,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2022/03/kadimcerrah.jpg",
      id: 1),
  Manga(
      name: "One Punch Man",
      score: 9,
      number: 165,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2021/07/12c1fa13-1c8d-422e-ae4f-365c29e88076.jpg",
      id: 2),
  Manga(
      name: "8.Sınıf Büyücü",
      score: 7.5,
      number: 15,
      poster:
          "https://asurascanstr.com/wp-content/uploads/2021/07/sinifbuyucuyen.jpg",
      id: 3),
];
