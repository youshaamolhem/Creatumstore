import 'package:creatum_store/helper/api.dart';

class GetCategories {
  Future<List<dynamic>> getCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
