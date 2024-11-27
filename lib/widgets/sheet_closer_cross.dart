import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';

Row sheetCloserCross({
  required BuildContext ctxt,
  String text = '',
  FontWeight fontWeight = FontWeight.w600,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Gap(35),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.spaceGrotesk(
              fontWeight: fontWeight,
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(ctxt),
          child: Container(
            width: 35,
            height: 30,
            decoration: const BoxDecoration(
              color: Constantes.greyColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                color: Colors.black54,
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
