import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gansa/models/item_model.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('events')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ItemModel(
            id: doc.id,
            title: doc['title'],
            imageURL: doc['image_URL'],
            releaseDate: (doc['release_date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }
}
