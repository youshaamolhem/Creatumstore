import 'package:creatum_store/helper/api.dart';
import 'package:creatum_store/models/product_model.dart';

class GetByCategorie {
  Future<List<ProductModel>> getByCategorie({required String catrgorie}) async {
    List<ProductModel> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$catrgorie');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
