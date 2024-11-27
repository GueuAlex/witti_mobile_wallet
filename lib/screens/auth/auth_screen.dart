import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/config/functions.dart';
import 'package:witti/widgets/custom_button.dart';

import 'registration.dart';
import 'widgets/auth_header.dart';
import 'widgets/welcome_texte.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const AuthHeader(),
                  const WelcomeText(),
                  const Gap(65),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        countrySelector(),
                        const Gap(10.0),
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 3,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 194, 194, 194),
                                ),
                              ),
                            ),
                            child: Functions.getTextField(
                              onChanged: (value) {
                                Functions.formatPhoneNumber(
                                  controller,
                                  value,
                                );
                              },
                              keyboardType: TextInputType.phone,
                              controller: controller,
                              textFieldLabel: '0X XX XX XX XX',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButton(
                  color: Constantes.primaryColor,
                  width: double.infinity,
                  height: 45,
                  radius: 25,
                  text: 'Continuer',
                  onPress: () async {
                    await Future.delayed(const Duration(seconds: 5));
                    if (mounted) {
                      Navigator.pushNamed(
                        context,
                        RegistrationScreen.routeName,
                      );
                    }
                  },
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Container countrySelector() => Container(
        //width: 150,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: const BoxDecoration(
          // color: Colors.grey,
          border: Border(
            bottom: BorderSide(
              width: 1.5,
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                '+225',
                style: GoogleFonts.spaceGrotesk(fontSize: 17),
              ),
              const Gap(5),
              const Icon(
                CupertinoIcons.chevron_down,
                size: 16,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            ],
          ),
        ),
      );
}
