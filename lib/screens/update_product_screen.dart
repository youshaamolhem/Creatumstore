import 'dart:js';
import 'dart:ui';

import 'package:creatum_store/helper/custom_button.dart';
import 'package:creatum_store/helper/custom_textfield.dart';
import 'package:creatum_store/models/product_model.dart';
import 'package:creatum_store/screens/new_trends_screen.dart';
import 'package:creatum_store/services/update_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateProductScreen extends StatefulWidget {
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, description, image, price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: 'Title',
            onChanged: (data) {
              title = data;
            },
          ),
          CustomTextField(
            hintText: 'Description',
            onChanged: (data) {
              description = data;
            },
          ),
          CustomTextField(
            hintText: 'ImageUrl',
            onChanged: (data) {
              image = data;
            },
          ),
          CustomTextField(
            hintText: 'Price',
            onChanged: (data) {
              price = data;
            },
          ),
          SizedBox(
            height: 25,
          ),
          CustomButton(
              label: 'Update',
              callback: () async {
                try {
                  await updateProduct(product);
                } on Exception catch (e) {
                  print('exception is ${e.toString()}');
                }
                await Navigator.pushNamed(context, NewTrendPage.id);
                // print('desription is $description');
              }),
        ],
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        price: price == null ? product.price.toString() : price!,
        title: title == null ? product.title : title!,
        category: product.category,
        id: product.id.toString());
  }
}
