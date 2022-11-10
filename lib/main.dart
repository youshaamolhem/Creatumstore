import 'package:creatum_store/screens/new_trends_screen.dart';
import 'package:creatum_store/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NewTrendPage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        NewTrendPage.id: (context) => NewTrendPage(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
      },
    );
  }
}
