import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description:
        'Dart is a client-optimized, open-source programming language developed by Google, primarily designed for building fast applications across multiple platforms.',
    image: '../../assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description:
        'Flutter is an open-source UI software development kit created by Google. ',
    image: '../../assets/ex3/firebase.png',
  ),
  firebase(
    title: 'Firebase',
    description:
        'Firebase helps you make your app the best it can be with tools for the entire journey. Customize Your App',
    image: '../../assets/ex3/flutter.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text('Product')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 100, height: 100),
            Text(product.title, style: TextStyle(fontSize: 40)),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
