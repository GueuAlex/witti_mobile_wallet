import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../../config/functions.dart';
import 'spinner_container.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isBonScreen = false,
  });

  final Map<String, dynamic> product;
  final bool isBonScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () => Navigator.of(context).pushNamed(
        ProductDetailsScreen.routeName,
        arguments: product,
      ), */
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
                    /*  color: product['color'].withOpacity(0.2), */
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
                  product['lot'],
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  '${Functions.numberFormat(product['jeton'].toString())} JW',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const Gap(3),
                if (!isBonScreen)
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
                else
                  _getWidget(product['status'] ?? '', product['date'] ?? '')
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
          child: SpinnerContainer(
            color: Constantes.primaryColor,
            child: Container(),
          ),
        ),
      ),
    );

    // Ajoute l'OverlayEntry

    overlay.insert(overlayEntry);

    // Retire l'OverlayEntry après une durée
    Future.delayed(const Duration(seconds: 7))
        .then((_) => overlayEntry.remove());
  }

  Widget _getWidget(String status, String date) {
    if (status.isEmpty) return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: _getColor(status),
          ),
          child: Text(
            status,
            style: GoogleFonts.spaceGrotesk(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
            ),
          ),
        ),
        const Gap(5),
        Text(
          date,
          style: GoogleFonts.spaceGrotesk(
            color: const Color.fromARGB(255, 82, 82, 82),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Color _getColor(String status) {
    switch (status) {
      case 'Livré':
        return const Color(0xFF4CAF50);

      case 'Livraison dans 2 jours' || 'Livraison dans 4 jours':
        return const Color(0xFFFFC107);
      case 'Expiré':
        return const Color(0xFFFF5722);
      default:
        return Colors.transparent;
    }
  }
}
