class Shoes {
  int id;
  String title;
  String? threeDModelUrl;
  List<String> imagesUrl;
  double price;
  bool isLiked;
  String? category;

  Shoes(
      {required this.id,
      required this.title,
      this.threeDModelUrl,
      required this.imagesUrl,
      required this.price,
      required this.isLiked,
      this.category});
}
