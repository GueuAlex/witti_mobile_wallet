import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/screens/auth/otp_screen.dart';

import '../../config/functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/horizontal_separator.dart';
import '../../widgets/infos_column.dart';
import '../../widgets/sheet_closer_cross.dart';
import '../../widgets/vertical_separator.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registrationScrreen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedGender = 'Je préfère ne pas répondre';
  final List<String> _genderList = [
    'Je préfère ne pas répondre',
    'Homme',
    'Femme',
    'Non-binaire',
    'Autre',
  ];

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as OTPScrenArgs;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Mes informatios',
          style: GoogleFonts.spaceGrotesk(fontSize: 16),
        ),
        /*  actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => _submit(),
              child: Text(
                'Inscription',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Constantes.primaryColor,
                ),
              ),
            ),
          )
        ], */
      ),
      body: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        highlightColor: Colors.transparent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(35),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Constantes.greyColor,
                      width: 0.8,
                    ),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  //height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: Constantes.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        //height: 45,

                        // decoration: BoxDecoration(b),
                        child: Row(
                          children: [
                            //Gap(3),
                            Expanded(
                              child: Functions.getTextField(
                                controller: _firstnameController,
                                textFieldLabel: 'Votre nom',
                              ),
                            ),
                            verticalSeparator(width: 0.8),
                            Expanded(
                              child: Functions.getTextField(
                                controller: _lastNameController,
                                textFieldLabel: 'Vos prénoms',
                              ),
                            )
                          ],
                        ),
                      ),
                      horizontalSeparator(width: double.infinity, height: 0.7),
                      Row(
                        children: [
                          Expanded(
                            child: Functions.getTextField(
                              controller: _emailController,
                              textFieldLabel: 'Votre adresse email',
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const Gap(5),
                          const Icon(CupertinoIcons.envelope),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Votre nom et prénoms seront public et nous envorrons des notifications à l\'adresse e-mail fournie.',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              // password
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  width: double.infinity,
                  //height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: Constantes.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Functions.getTextField(
                          controller: _passwordController,
                          textFieldLabel: 'Définir un mot de passe',
                          obscureText: _obscureText,
                        ),
                      ),
                      const Gap(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          !_obscureText
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //  const Gap(25),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final DateTime? result =
                            await showAdaptiveDateTimePicker(
                          context: context,
                          mode: DateTimeFieldPickerMode.date,
                          initialPickerDateTime: DateTime.now(),
                          lastDate: DateTime.now(),
                          pickerPlatform: DateTimeFieldPickerPlatform.adaptive,
                        );
                        setState(() {
                          _selectedDate = result ?? DateTime.now();
                        });
                      },
                      child: InfosColumn(
                        height: 50,
                        label: 'Date de naissance',
                        labelFontSize: 15,
                        widget: Text(
                          DateFormat('EEEE d MMMM yyyy', 'fr')
                              .format(_selectedDate),
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: horizontalSeparator(
                            width: double.infinity, height: 0.8)),
                    InkWell(
                      onTap: () {
                        if (Platform.isIOS) {
                          _cupertinoSelector();
                        } else {
                          _genderSelector();
                        }
                      },
                      child: InfosColumn(
                        height: 50,
                        label: 'Genre',
                        labelFontSize: 15,
                        widget: Text(
                          _selectedGender,
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(20),
              //if (!Platform.isIOS)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CustomButton(
                  color: Constantes.primaryColor,
                  width: double.infinity,
                  height: 45,
                  radius: 25,
                  text: 'S\'inscrire',
                  onPress: () async {
                    await Future.delayed(const Duration(seconds: 5));
                    if (mounted) {
                      Navigator.pushNamed(
                        context,
                        OtpScreen.routeName,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cupertinoSelector() {
    // Utiliser le CupertinoPicker pour iOS
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler')),
        actions: [
          SizedBox(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Colors.white.withOpacity(0.5),
              itemExtent: 45.0,
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedGender = _genderList[index];
                });
              },
              children: _genderList.map((gender) {
                return Center(
                  child: Text(
                    gender,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16.5,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  _genderSelector() {
    return Functions.showSimpleBottomSheet(
        ctxt: context,
        widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                sheetCloserCross(
                    ctxt: context,
                    text: 'Sélectionner un genre',
                    fontWeight: FontWeight.w400),
                const Gap(20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _genderList.map((gender) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedGender = gender;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    gender,
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 16.5,
                                    ),
                                  ),
                                ),
                                const Gap(5),
                                Container(),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            )));
  }
}
