import 'package:creatum_store/helper/shop_card.dart';
import 'package:creatum_store/models/product_model.dart';
import 'package:creatum_store/services/all_products.dart';
import 'package:flutter/material.dart';

class NewTrendPage extends StatefulWidget {
  static String id = 'NewTrendPage';
  const NewTrendPage({super.key});

  @override
  State<NewTrendPage> createState() => _NewTrendPageState();
}

class _NewTrendPageState extends State<NewTrendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'New Trends',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 90),
            child: FutureBuilder<List<ProductModel>>(
              future: GetAllProduct().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel>? productsList = snapshot.data;
                  return GridView.builder(
                    itemCount: productsList!.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        mainAxisSpacing: 100,
                        crossAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return ShopCard(
                        product: productsList[index],
                      );
                    },
                  );
                } else {
                  print('snapshot is ${snapshot.data}');
                  return Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
