import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constantes.dart';
import '../../../models/action_buttons.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({super.key, required this.actionButton});
  final ActionButton actionButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, actionButton.route),
          child: Container(
            width: 42,
            height: 42,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constantes.greyColor.withOpacity(0.7),
            ),
            child: SvgPicture.asset(actionButton.svg, width: 25),
          ),
        ),
        Text(
          actionButton.title,
          style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
