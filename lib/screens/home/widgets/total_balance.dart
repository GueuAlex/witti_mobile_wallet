import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total balance',
            textAlign: TextAlign.right,
            style: GoogleFonts.spaceGrotesk(
              color: const Color.fromARGB(255, 96, 96, 96),
            ),
          ),
          Text(
            '977 895.0 XOF',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
