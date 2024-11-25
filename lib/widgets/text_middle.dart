import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';

Row textMidleLine({String text = 'Continuer le paiement avec'}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          width: double.infinity,
          height: 1,
          color: Constantes.greyColor,
        ),
      ),
      Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w300,
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 1,
          color: Constantes.greyColor,
        ),
      )
    ],
  );
}
