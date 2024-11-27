import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../transactions/all_transactions.dart';
import 'transaction_container.dart';

class LastTransactions extends StatelessWidget {
  const LastTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                AllTransaction.routeName,
              ),
              child: Text(
                'Voir plus',
                textAlign: TextAlign.right,
                style: GoogleFonts.spaceGrotesk(
                  color: const Color.fromARGB(255, 96, 96, 96),
                ),
              ),
            )
          ],
        ),
        const Gap(15.0),
        Column(
          children: Constantes.transactions
              .map((tr) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TransactionContainer(
                      transaction: tr,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
