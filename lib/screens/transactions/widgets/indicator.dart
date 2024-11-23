import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    const Color entreeColor = Color.fromARGB(255, 8, 151, 82); // Bleu
    const Color sortieColor = Color.fromARGB(255, 170, 14, 2); // Rouge
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                color: entreeColor,
              ),
              const SizedBox(width: 5),
              Text(
                'Deposits',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                color: sortieColor,
              ),
              const SizedBox(width: 5),
              Text(
                'Withdrawals',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
