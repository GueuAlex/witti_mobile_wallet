import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../transaction/transaction_details.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({
    super.key,
    required this.transaction,
  });
  final Map<String, dynamic> transaction;

  @override
  Widget build(BuildContext context) {
    String hours = transaction['heure'];
    String status = transaction['status'];
    bool isDeposit = transaction['type'] == 'Deposit';
    String sign = isDeposit ? '+' : '-';
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          TransactionDetails.routeName,
          arguments: transaction,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Constantes.greyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            transaction['assetPath'],
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: SvgPicture.asset(
                            isDeposit
                                ? 'assets/icon/receive.svg'
                                : 'assets/icon/send.svg',
                            width: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['name'],
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        '$hours \u2022 $status',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              '$sign ${transaction['amount']}',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
