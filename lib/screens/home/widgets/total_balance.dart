import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key, this.withLabel = true});
  final bool withLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: withLabel
          ? Column(
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
            )
          : Column(
              children: [
                Text(
                  '977 895.0 XOF',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //const Gap(3),
                Text(
                  '+4.5% from last month',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color.fromARGB(255, 96, 96, 96),
                  ),
                )
              ],
            ),
    );
  }
}
