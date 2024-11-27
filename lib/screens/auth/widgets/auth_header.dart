import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.isOtp = false,
  });

  final bool isOtp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isOtp
              ? Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.back,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Text(
            'Support client',
            style: GoogleFonts.spaceGrotesk(
              color: const Color.fromARGB(255, 5, 87, 174),
            ),
          )
        ],
      ),
    );
  }
}
