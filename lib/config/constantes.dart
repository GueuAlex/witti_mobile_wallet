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
}
