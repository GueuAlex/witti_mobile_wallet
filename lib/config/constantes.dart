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
      'heure': '12:00',
      'type': 'Dépôt',
      'amount': '10 000 XOF',
      'status': 'Confirmé',
    },
    {
      'id': 2,
      'name': 'Abdullah Baharuddin ',
      'assetPath': 'assets/images/avatar4.png',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'heure': '08:00',
      'type': 'Retrait',
      'amount': '245 000 XOF',
      'status': 'Confirmé',
    },
    {
      'id': 3,
      'name': 'Megawati S P',
      'assetPath': 'assets/images/avatar3.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '15:00',
      'type': 'Dépôt',
      'amount': '515 000 XOF',
      'status': 'Suspendu',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '11:00',
      'type': 'Retrait',
      'amount': '35 000 XOF',
      'status': 'Confirmé',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '7:00',
      'type': 'Dépôt',
      'amount': '135 000 XOF',
      'status': 'Suspendu',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '1:00',
      'type': 'Dépôt',
      'amount': '735 000 XOF',
      'status': 'Confirmé',
    },
    {
      'id': 4,
      'name': 'Dewi Haris Mat',
      'assetPath': 'assets/images/avatar1.png',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'heure': '5:00',
      'type': 'Retrait',
      'amount': '356 000 XOF',
      'status': 'Annulé',
    },
  ];

  static const List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Nike Air-Max-290',
      'description':
          'Nike Air-Max-290\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
      'assetPath': 'assets/images/product1.png',
      'price': '25000',
      'miniature': [
        'assets/images/product1.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 2,
      'name': 'Ps5 Pro + Casque sans fil',
      'description':
          'Playstation 5 Pro + Casque sans fil\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
      'assetPath': 'assets/images/product2.png',
      'price': '450000',
      'miniature': [
        'assets/images/product2.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 4,
      'name': 'Vans Old Skool - Addidas',
      'description':
          'Chaussure de skate Sneakers Vans Old Skool, adidas, adidas, chaussure de sport png\nLorem Ipsum is simply dummy text of the printing',
      'assetPath': 'assets/images/product5.png',
      'price': '255000',
      'miniature': [
        'assets/images/product5.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 3,
      'name': 'Samsung Galxay S24 Ultra HD',
      'description':
          'Smart phone Samsung Galaxy S24\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
      'assetPath': 'assets/images/product3.png',
      'price': '655000',
      'miniature': [
        'assets/images/product3.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 5,
      'name': 'iPhone 16 Pro Max - Black',
      'description':
          'Smart phone iPhone 16 pro max - black edition\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      'assetPath': 'assets/images/product4.png',
      'price': '655000',
      'miniature': [
        'assets/images/product4.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 6,
      'name': 'Nike Free-Air-Force',
      'description':
          'Nike Air Max Nike Free Air Force Chaussure, nike, Blanc, Chaussure de plein air png\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
      'assetPath': 'assets/images/product6.png',
      'price': '155000',
      'miniature': [
        'assets/images/product6.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
    {
      'id': 5,
      'name': 'Nike Air-Jordan Max',
      'description':
          'Nike Air Max Sneakers Shoe Air Jordan, homme chaussures, blanc, basket-ballschuh pngSmart phone iPhone 16 pro max - black edition\nLorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'assetPath': 'assets/images/product7.png',
      'price': '375000',
      'miniature': [
        'assets/images/product7.png',
        'assets/images/miniature4.webp',
        'assets/images/miniature1.webp',
        'assets/images/miniature2.webp',
        'assets/images/miniature3.webp',
      ],
    },
  ];

  static List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'type': 'ECOPREMIUM',
      'jeton': 50,
      'lot': 'T-shirt',
      'assetPath': 'assets/images/tshirt.png',
      'is_bon': false,
      'color': const Color(0xFF4CAF50), // Green color for ECOPREMIUM
      'value': '',
      'status': 'Livré',
      'date': '26/11/2024'
    },
    {
      'id': 2,
      'type': 'EXECUTIVE',
      'jeton': 100,
      'lot': 'Bloc notes et Stylos',
      'assetPath': 'assets/images/notepad-pen.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107), // Yellow color for EXECUTIVE
      'value': '',
      'status': 'Livraison dans 2 jours',
    },
    {
      'id': 3,
      'type': 'EXECUTIVE',
      'jeton': 200,
      'lot': 'Protège passeport en cuir',
      'assetPath': 'assets/images/passport.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': '',
      'status': 'Expiré',
      'date': '20/11/2024'
    },
    {
      'id': 4,
      'type': 'EXECUTIVE',
      'jeton': 300,
      'lot': 'Senteur pour véhicule',
      'assetPath': 'assets/images/senteur.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': '',
      'status': 'Livraison dans 4 jours'
    },
    {
      'id': 5,
      'type': 'EXECUTIVE',
      'jeton': 400,
      'lot': 'Coussin de voyage',
      'assetPath': 'assets/images/cousin.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': '',
      'status': 'Livré',
      'date': '10/11/2024'
    },
    {
      'id': 6,
      'type': 'EXECUTIVE',
      'jeton': 500,
      'lot': 'Mug',
      'assetPath': 'assets/images/mug.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': '',
      'status': 'Expiré',
      'date': '05/11/2024'
    },
    {
      'id': 7,
      'type': 'EXECUTIVE',
      'jeton': 600,
      'lot': 'Porte clés Premium',
      'assetPath': 'assets/images/portcle.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': ''
    },
    {
      'id': 8,
      'type': 'EXECUTIVE',
      'jeton': 700,
      'lot': 'Bouchons d\'oreilles',
      'assetPath': 'assets/images/bouchon.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': ''
    },
    {
      'id': 9,
      'type': 'EXECUTIVE',
      'jeton': 800,
      'lot': 'Trousse de voyage',
      'assetPath': 'assets/images/trousse.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': ''
    },
    {
      'id': 10,
      'type': 'EXECUTIVE',
      'jeton': 900,
      'lot': '2-3 Tickets cinéma (Max 10 000F)',
      'assetPath': 'assets/images/tickets.png',
      'is_bon': false,
      'color': const Color(0xFFFFC107),
      'value': ''
    },
    {
      'id': 11,
      'type': 'EXECUTIVE+',
      'jeton': 1000,
      'lot': 'Boîte à pharmacie',
      'assetPath': 'assets/images/boite.png',
      'is_bon': false,
      'color': const Color(0xFFFF5722), // Orange color for EXECUTIVE+
      'value': ''
    },
    {
      'id': 12,
      'type': 'EXECUTIVE+',
      'jeton': 2500,
      'lot': 'Bon d\'achat 25 000F',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFFFF5722),
      'value': '25000'
    },
    {
      'id': 13,
      'type': 'EXECUTIVE+',
      'jeton': 3500,
      'lot': 'Bon d\'achat 35 000F',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFFFF5722),
      'value': '35000'
    },
    {
      'id': 14,
      'type': 'FIRST CLASS',
      'jeton': 4000,
      'lot': 'Bon restaurant 40 000F',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFF000000), // Black color for FIRST CLASS
      'value': '40000'
    },
    {
      'id': 15,
      'type': 'FIRST CLASS',
      'jeton': 5000,
      'lot': 'Carte cadeaux Luxe 50 000 F',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFF000000),
      'value': '50000'
    },
    {
      'id': 16,
      'type': 'FIRST CLASS',
      'jeton': 5000,
      'lot': 'Remboursement salon aéroport',
      'assetPath': 'assets/images/offers.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 17,
      'type': 'FIRST CLASS',
      'jeton': 10000,
      'lot': 'Séance au spa',
      'assetPath': 'assets/images/offers.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 18,
      'type': 'FIRST CLASS',
      'jeton': 10000,
      'lot':
          'Surprises anniversaires (chocolats de chez Pachi ou Cakes à livrer)',
      'assetPath': 'assets/images/suprise.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 19,
      'type': 'FIRST CLASS',
      'jeton': 10000,
      'lot': 'Bon Cigares',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFF000000),
      'value': '10000'
    },
    {
      'id': 20,
      'type': 'FIRST CLASS',
      'jeton': 15000,
      'lot': 'Séance au spa premium',
      'assetPath': 'assets/images/offers.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 21,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': 'Parfums Zino / Beauty success',
      'assetPath': 'assets/images/parfum.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 22,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': 'Bon spiritueux',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFF000000),
      'value': '20000'
    },
    {
      'id': 23,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': 'Bon d\'achat 200 000F',
      'assetPath': 'assets/images/offers.png',
      'is_bon': true,
      'color': const Color(0xFF000000),
      'value': '200000'
    },
    {
      'id': 24,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': 'Casques ou écouteurs de marques',
      'assetPath': 'assets/images/casque.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 25,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': 'Pass concert/spectacle au choix',
      'assetPath': 'assets/images/pass.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 26,
      'type': 'FIRST CLASS',
      'jeton': 20000,
      'lot': '4 Tickets Brunch hôtel de luxe',
      'assetPath': 'assets/images/brunch.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 27,
      'type': 'FIRST CLASS',
      'jeton': 30000,
      'lot':
          'Paniers cadeau Pâques ou Ramadan (100 000 Max) et Noël (200 000 max)',
      'assetPath': 'assets/images/panier.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    },
    {
      'id': 28,
      'type': 'FIRST CLASS',
      'jeton': 60000,
      'lot': 'Forfait abonnement 6 mois club de sport au choix',
      'assetPath': 'assets/images/offers.png',
      'is_bon': false,
      'color': const Color(0xFF000000),
      'value': ''
    }
  ];
}
