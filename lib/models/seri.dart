class Seri {
  final int id;
  final String name;
  final double score;
  final int rank;
  final String posterAddress;
  final String description;
  final int numOfEpisodes;
  final String? notes;
  const Seri(
      {required this.id,
      required this.name,
      required this.score,
      required this.rank,
      required this.posterAddress,
      required this.description,
      required this.numOfEpisodes,
      this.notes});

  static Seri fromJson(json) => Seri(
      id: json['id'],
      name: json['name'],
      score: json['score'],
      rank: json['rank'],
      posterAddress: json['posterAddress'],
      description: json['description'],
      numOfEpisodes: json['numOfEpisodes']);
}
