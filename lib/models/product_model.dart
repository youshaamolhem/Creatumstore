class ProductModel {
  final dynamic id;
  final String title, description, image, category;
  final dynamic price;
  RatingModel? ratingModel;
  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.ratingModel,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price'],
        category: jsonData['category'],
        ratingModel: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
