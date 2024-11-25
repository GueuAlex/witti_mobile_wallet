import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../../config/functions.dart';
import '../../product/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailsScreen.routeName,
        arguments: product,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            height: 130,
            //color: Colors.green,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Constantes.greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  child: Image.asset(
                    product['assetPath'],
                    width: 120,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  '${Functions.numberFormat(product['price'])} XOF',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const Gap(3),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showCustomSnackbar(context),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Constantes.greyColor.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Constantes.greyColor.withOpacity(0.12),
                      ),
                      child: const Center(
                        child: Text('0'),
                      ),
                    ),
                    const Gap(5),
                    GestureDetector(
                      onTap: () => _showCustomSnackbar(context),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Constantes.greyColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showCustomSnackbar(BuildContext context) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      canSizeOverlay: true,
      builder: (context) => Positioned(
        top: kToolbarHeight, // Position du snackbar en haut
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(240, 43, 158, 139),
              borderRadius: BorderRadius.circular(10),
              /* boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(239, 80, 182, 110),
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ], */
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: Text(
                    "Ajouté à votre panier !",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constantes.greyColor.withOpacity(0.4),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.delete),
                      Gap(5),
                      Text(
                        "Voir",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Ajoute l'OverlayEntry

    overlay.insert(overlayEntry);

    // Retire l'OverlayEntry après une durée
    Future.delayed(const Duration(seconds: 3))
        .then((_) => overlayEntry.remove());
  }
}
