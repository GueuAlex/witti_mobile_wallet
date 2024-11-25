import 'package:flutter/material.dart';

import '../../widgets/go_back.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/productdetailsscreen';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GoBack(
            text: product['name'] ?? '',
          ),
          Center(
            child: Text(
              product['name'] ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
