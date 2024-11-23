import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_keyboard.dart';
import '../../widgets/go_back.dart';
import 'widgets/row_card.dart';

class SendScreen extends StatefulWidget {
  static const routeName = '/sendeScreen';
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GoBack(
            text: 'Envoyer de l\'argent',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                const RowCard(),
                const Gap(12.0),
                const RowCard(
                  isCreditCard: true,
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Text(
                    'Enter your amount',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.spaceGrotesk(
                      height: 0,
                      color: const Color.fromARGB(255, 96, 96, 96),
                    ),
                  ),
                )
              ],
            ),
          ),
          const CustomKeyboard(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                width: double.infinity,
                height: 50,
                radius: 25,
                color: Constantes.primaryColor,
                text: 'Send Money',
                onPress: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
