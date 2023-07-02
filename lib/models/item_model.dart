
class ItemModel {
  ItemModel({
    required this.title,
    required this.imageURL,
    required this.ended,
    required this.likes,
    required this.releaseDate,
  });

  final String title;
  final String imageURL;
  final bool ended;
  final double likes;
  final DateTime releaseDate;
}


