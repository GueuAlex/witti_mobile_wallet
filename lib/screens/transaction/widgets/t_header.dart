import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';

class TransHeader extends StatelessWidget {
  const TransHeader({
    super.key,
    required this.transaction,
  });
  final Map<String, dynamic> transaction;

  @override
  Widget build(BuildContext context) {
    bool isDeposit = transaction['type'] == 'Deposit';
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction['amount'],
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                transaction['name'],
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 97, 97, 97),
                ),
              ),
              const Gap(5),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                decoration: BoxDecoration(
                  color: isDeposit
                      ? Colors.green.withOpacity(0.08)
                      : Colors.red.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  transaction['type'],
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    color: isDeposit ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            color: Constantes.greyColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            transaction['assetPath'],
          ),
        )
      ],
    );
  }
}
