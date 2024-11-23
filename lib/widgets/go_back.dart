import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';

class GoBack extends StatelessWidget {
  const GoBack({
    super.key,
    this.text = 'Détails de la transaction',
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.opacity = 0.25,
  });
  final String text;
  final Color textColor;
  final Color iconColor;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                /* width: 50,
                height: 50, */
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Constantes.greyColor.withOpacity(opacity),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constantes.greyColor,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icon/fleche-gauche.svg',
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            const Gap(50)
          ],
        ),
      ),
    );
  }
}
