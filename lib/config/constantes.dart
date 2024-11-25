import 'package:flutter/material.dart';

class Constantes {
  static const primaryColor = Color(0xFF1f2b51);
  static const blackColor = Color(0xFF1B1B1B);
  static const greyColor = Color(0xFFE4E4E4);

  static List<Map<String, dynamic>> transactions = [
    {
      'id': 1,
      'name': 'Sitti Maymunah Suhardi',
      'assetPath': 'assets/images/avatar.png',
      'date': DateTime.now(),
      'heure': '12:00 PM',
      'type': 'Deposit',
      'amount': '10 000 XOF',
      'status': 'Completed',
    },
    {
      'id': 2,
      'name': 'Abdullah Baharuddin ',
      'assetPath': 'assets/images/avatar4.png',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'heure': '08:00 AM',
      'type': 'Withdraw',
      'amount': '245 000 XOF',
      'status': 'Completed',
    },
    {
      'id': 3,
      'name': 'Megawati S P',
      'assetPath': 'assets/images/avatar3.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '15:00 PM',
      'type': 'Deposit',
      'amount': '515 000 XOF',
      'status': 'Pending',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '11:00 PM',
      'type': 'Withdraw',
      'amount': '35 000 XOF',
      'status': 'Completed',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '7:00 PM',
      'type': 'Deposit',
      'amount': '135 000 XOF',
      'status': 'Pending',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '1:00 PM',
      'type': 'Deposit',
      'amount': '735 000 XOF',
      'status': 'Completed',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '5:00 PM',
      'type': 'Withdraw',
      'amount': '356 000 XOF',
      'status': 'Cancelled',
    },
  ];

  static const List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Nike Air-Max-290',
      'description': 'Nike Air-Max-290',
      'assetPath': 'assets/images/product1.png',
      'price': '25000',
      'miniature': [],
    },
    {
      'id': 2,
      'name': 'Ps5 Pro + Casque sans fil',
      'description': 'Playstation 5 Pro + Casque sans fil',
      'assetPath': 'assets/images/product2.png',
      'price': '450000',
      'miniature': [],
    },
    {
      'id': 4,
      'name': 'Vans Old Skool - Addidas',
      'description':
          'Chaussure de skate Sneakers Vans Old Skool, adidas, adidas, chaussure de sport png',
      'assetPath': 'assets/images/product5.png',
      'price': '255000',
      'miniature': [],
    },
    {
      'id': 3,
      'name': 'Samsung Galxay S24 Ultra HD',
      'description': 'Smart phone Samsung Galaxy S24',
      'assetPath': 'assets/images/product3.png',
      'price': '655000',
      'miniature': [],
    },
    {
      'id': 5,
      'name': 'iPhone 16 Pro Max - Black',
      'description': 'Smart phone iPhone 16 pro max - black edition',
      'assetPath': 'assets/images/product4.png',
      'price': '655000',
      'miniature': [],
    },
    {
      'id': 6,
      'name': 'Nike Free-Air-Force',
      'description':
          'Nike Air Max Nike Free Air Force Chaussure, nike, Blanc, Chaussure de plein air png',
      'assetPath': 'assets/images/product6.png',
      'price': '155000',
      'miniature': [],
    },
    {
      'id': 5,
      'name': 'Nike Air-Jordan Max',
      'description':
          'Nike Air Max Sneakers Shoe Air Jordan, homme chaussures, blanc, basket-ballschuh pngSmart phone iPhone 16 pro max - black edition',
      'assetPath': 'assets/images/product7.png',
      'price': '375000',
      'miniature': [],
    },
  ];
}
