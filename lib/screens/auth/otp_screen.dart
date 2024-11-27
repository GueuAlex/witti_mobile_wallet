import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/screens/home/home.dart';
import 'package:witti/widgets/custom_keyboard.dart';

import 'widgets/auth_header.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp_screen';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = ''; // Correction de la faute de frappe : '_opt' -> '_otp'
  static const int otpLength =
      6; // Définir la longueur du code OTP comme constante
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const AuthHeader(
              isOtp: true,
            ),
            const Gap(35),
            const UserInfos(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(otpLength, (index) {
                  // Utiliser la constante otpLength
                  return OtpDot(isFilled: index < _otp.length);
                }),
              ),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child:
                  isLoading ? const CircularProgressIndicator.adaptive() : null,
            ),
            CustomKeyboard(
              withOutPut: false,
              keyboardPadding: 50,
              onChange: (kvalue) async {
                setState(() {
                  // Limiter la longueur de _otp à otpLength
                  _otp = kvalue.length <= otpLength ? kvalue : _otp;
                });
                if (_otp.length >= 6) {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 5));
                  setState(() {
                    isLoading = false;
                  });
                  if (mounted) {
                    Navigator.pushNamed(
                      context,
                      WittiHome.routeName,
                    );
                  }
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Code oublier ?',
                style: GoogleFonts.spaceGrotesk(
                  color: const Color.fromARGB(255, 5, 87, 174),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Extraire le widget OtpDot pour une meilleure réutilisation et lisibilité
class OtpDot extends StatelessWidget {
  final bool isFilled;

  const OtpDot({Key? key, required this.isFilled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color:
            isFilled ? Constantes.primaryColor : Colors.grey.withOpacity(0.35),
        shape: BoxShape.circle,
      ),
    );
  }
}

class UserInfos extends StatelessWidget {
  const UserInfos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constantes.greyColor.withOpacity(0.5),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 199, 199, 199),
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/avatar4.png',
              width: 100,
            ),
          ),
        ),
        Text(
          'Hey Leonardo',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'Entrez votre code pour vous connecter',
          style: GoogleFonts.spaceGrotesk(),
        ),
      ],
    );
  }
}
