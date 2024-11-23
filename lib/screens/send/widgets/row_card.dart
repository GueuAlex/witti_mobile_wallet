import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';

class RowCard extends StatelessWidget {
  const RowCard({
    super.key,
    this.isCreditCard = false,
  });

  final bool isCreditCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.8,
          color: Constantes.greyColor,
        ),
      ),
      child: !isCreditCard
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/avatar3.png',
                  ),
                ),
                const Gap(5.0),
                Expanded(
                  child: Text(
                    'Megawati S P',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  CupertinoIcons.pen,
                  color: Color.fromARGB(255, 51, 51, 51),
                )
              ],
            )
          : Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icon/carte-de-credit.svg',
                  ),
                ),
                const Gap(5.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Michael Bubble',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          //height: 0,
                        ),
                      ),
                      Text(
                        '--- --- 8793',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.spaceGrotesk(
                          height: 0,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  color: Color.fromARGB(255, 51, 51, 51),
                )
              ],
            ),
    );
  }
}
