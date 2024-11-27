import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/widgets/custom_button.dart';

import '../../config/functions.dart';
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Constantes.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(380, 190),
              ),
            ),
          ),
          Column(
            children: [
              GoBack(
                text: product['name'] ?? '',
                textColor: Colors.white,
                iconColor: Colors.white,
                opacity: 0.12,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4 -
                        (kToolbarHeight + 10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MiniatureWidget(
                          miniatures: product['miniature'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product['name'],
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${Functions.numberFormat(product['price'])} XOF',
                              style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                decoration:
                                    TextDecoration.underline, // Soulignement
                                decorationColor:
                                    Colors.orange, // Couleur du soulignement
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8.0),
                        child: Text(
                          product['description'],
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color.fromARGB(255, 70, 70, 70),
                          ),
                        ),
                      ),
                      /*   SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15.0),
                          child: Text(
                            'MODE DETAILS',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SelectioneWidget(), */
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15.0,
                        ),
                        child: CustomButton(
                          color: Constantes.primaryColor,
                          width: double.infinity,
                          height: 50,
                          radius: 25,
                          text: 'Retour',
                          onPress: () async {
                            //await Future.delayed(const Duration(seconds: 3));
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: kToolbarHeight + 60,
            child: Image.asset(
              product['assetPath'],
              width: 350,
            ),
          )
        ],
      ),
    );
  }
}

class SelectioneWidget extends StatelessWidget {
  const SelectioneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    'UK',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(10.0),
                  Text(
                    'USA',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 152, 152, 152),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MiniatureWidget extends StatelessWidget {
  const MiniatureWidget({
    super.key,
    required this.miniatures,
  });
  final List<String> miniatures;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: miniatures
                .map(
                  (img) => Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Constantes.greyColor.withOpacity(0.12),
                      border: Border.all(
                          width: 0.8,
                          color: Constantes.greyColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(img),
                    ),
                  ),
                )
                .toList(),
          ),
          const Gap(8.0),
          Container(
            width: double.infinity,
            height: 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Constantes.primaryColor.withOpacity(0.2),
                  Constantes.primaryColor.withOpacity(0.4),
                  Constantes.primaryColor.withOpacity(0.6),
                  Constantes.primaryColor.withOpacity(0.8),
                  Constantes.primaryColor,
                ],
                begin: Alignment.centerRight, // Départ du gradient (droite)
                end: Alignment.centerLeft, // Fin du gradient (gauche)
              ),
            ),
          )
        ],
      ),
    );
  }
}
