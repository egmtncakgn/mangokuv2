import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangokuv2/models/seri.dart';

class FFHelper {
  List<Seri> serileriListele(QuerySnapshot serilerHam) {
    List<Seri> seriler = List.empty(growable: true);

    for (var docs in serilerHam.docs) {
      var seri = Seri(
          id: docs['id'],
          name: docs['name'],
          score: docs['score'],
          rank: docs['rank'],
          posterAddress: docs['posterAddress'],
          description: docs['description'],
          numOfEpisodes: docs['numOfEpisodes'],
          notes: docs['notes']);
      seriler.add(seri);
    }

    return seriler;
  }
}
