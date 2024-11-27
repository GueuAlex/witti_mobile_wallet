import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/widgets/go_back.dart';

import '../../config/constantes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_keyboard.dart';
import 'widgets/differences.dart';
import 'widgets/draggable_sheet.dart';
import 'widgets/row_card.dart';

class ConvertScreen extends StatefulWidget {
  static const routeName = '/convertscreen';
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  //

  final _confettiController = ConfettiController();
/*   int _wcToXof({required String wc}) {
    if (wc.isEmpty) {
      return 0; // Retourne 0 si la chaîne est vide
    }
    return int.parse(wc) * 25000;
  } */

  //int _resultXof = 0;
  //
  String _resultXof = '';
  bool isPlaying = false;
  List<Map<String, dynamic>> _obons = [];

  @override
  void dispose() {
    _confettiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLargeScreen = size.height > 752;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: isLargeScreen ? size.height * 0.27 : size.height * 0.25,
              color: Constantes.primaryColor),
          Column(
            children: [
              ConfettiWidget(confettiController: _confettiController),
              const GoBack(
                text: 'Convertir vos wc en bons',
                textColor: Colors.white,
                iconColor: Colors.white,
                opacity: 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    const RowCard(),
                    const Gap(10),
                    const Differences(),

                    ///const Gap(10),
                    /*   RowCard(
                      isXof: true,
                      value: _resultXof,
                    ),
                    const Gap(25), */
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Text(
                        'Entrez le nombre de JW à convertir en bons/cadeaux',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spaceGrotesk(
                          height: 0,
                          color: const Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomKeyboard(
                devise: 'JW',
                onChange: (value) {
                  // Mettre à jour une variable ou effectuer une action dans le parent
                  // print("Valeur mise à jour : $value");
                  setState(() {
                    // _resultXof = _wcToXof(wc: value);
                    _resultXof = value;
                  });
                },
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    width: double.infinity,
                    height: 50,
                    radius: 25,
                    color: Constantes.primaryColor,
                    text: 'Convertir',
                    onPress: () async {
                      _obons = [];
                      int jw = int.parse(_resultXof);
                      for (var e in Constantes.data) {
                        if (jw >= e['jeton']) {
                          _obons.add(e);
                        }
                      }

                      await Future.delayed(const Duration(seconds: 3));

                      //_jw = widget.voucherValue;

                      if (mounted) {
                        _showBottomSheet(context);
                      }
                    },
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5),
        ),
      ),
      builder: (context) {
        return DraggableSheet(
            voucherValue: int.parse(_resultXof), cbons: _obons);
      },
    );
  }
}
