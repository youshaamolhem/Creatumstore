import 'package:creatum_store/models/product_model.dart';
import 'package:creatum_store/helper/api.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String title,
      required dynamic price,
      required String description,
      required String image,
      required String category,
      required dynamic id}) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
      'id': id,
    });

    return ProductModel.fromJson(data);
  }
}
