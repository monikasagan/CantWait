class ItemModel {
  ItemModel(
    this.ended, {
    required this.title,
    required this.imageURL,
    required this.likes,
    required this.releaseDate,
  });

  final String title;
  final String imageURL;
  final bool ended;
  final double likes;
  final DateTime releaseDate;
}
