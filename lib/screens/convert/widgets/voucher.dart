import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../../config/functions.dart';
import '../../../widgets/custom_button.dart';

class Voucher extends StatelessWidget {
  const Voucher({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Constantes.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icon/avantages-du-coffret-cadeau.svg',
              width: 18,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(12),
              Text(
                '${Functions.numberFormat(value)} JW',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  height: -0.0005,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(12),
              Text(
                'Bon d\'achat',
                textAlign: TextAlign.right,
                style: GoogleFonts.spaceGrotesk(
                  height: -0.0002,
                  color: const Color.fromARGB(255, 96, 96, 96),
                ),
              ),
            ],
          ),
        ),
        CustomButton(
            color: Constantes.primaryColor,
            width: 35,
            height: 35,
            radius: 5,
            text: '',
            icon: Icons.save,
            onPress: () async {
              await Future.delayed(const Duration(seconds: 3));
            })
      ],
    );
  }
}
