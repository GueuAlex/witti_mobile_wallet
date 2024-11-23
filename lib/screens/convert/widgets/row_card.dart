import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/functions.dart';

import '../../../config/constantes.dart';

class RowCard extends StatelessWidget {
  const RowCard({
    super.key,
    this.isXof = false,
    this.value,
  });

  final bool isXof;
  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: !isXof
            ? const Color.fromARGB(17, 199, 241, 248)
            : Constantes.greyColor.withOpacity(0.4),
      ),
      child: !isXof
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Constantes.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/witti.jpg'),
                  ),
                ),
                const Gap(5.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WC',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Witti Coin',
                        style: GoogleFonts.spaceGrotesk(
                          height: 0,
                          color: const Color.fromARGB(255, 214, 214, 214),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${Functions.numberFormat('523490')} WC',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Constantes.greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icon/signe-francais.svg',
                  ),
                ),
                const Gap(5.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'XOF',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          //height: 0,
                        ),
                      ),
                      Text(
                        'Franc CFA de bons',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.spaceGrotesk(
                          height: 0,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${value != null ? Functions.numberFormat(value.toString()) : 0} XOF',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w500,
                    //height: 0,
                  ),
                ),
              ],
            ),
    );
  }
}
