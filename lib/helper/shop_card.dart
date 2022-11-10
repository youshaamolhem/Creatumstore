import 'package:creatum_store/models/product_model.dart';
import 'package:creatum_store/screens/update_product_screen.dart';

import 'package:flutter/material.dart';

class ShopCard extends StatefulWidget {
  ShopCard({required this.product});
  ProductModel product;

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Card(
              elevation: 8,
              shadowColor: Color.fromARGB(255, 253, 251, 251),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      child: Text(
                        widget.product.title,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${widget.product.price}'),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: 90,
            child: Image.network(
              widget.product.image,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _navigateAndDisplayUpdate(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateProductScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
  }
}
