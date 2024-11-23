import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/widgets/go_back.dart';

import '../../config/constantes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_keyboard.dart';
import 'widgets/row_card.dart';

class ConvertScreen extends StatefulWidget {
  static const routeName = '/convertscreen';
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  //
  final _scrollController = DraggableScrollableController();
  int _wcToXof({required String wc}) {
    if (wc.isEmpty) {
      return 0; // Retourne 0 si la chaîne est vide
    }
    return int.parse(wc) * 25000;
  }

  int _resultXof = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.244,
              color: Constantes.primaryColor),
          Column(
            children: [
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
                    const Gap(10),
                    RowCard(
                      isXof: true,
                      value: _resultXof,
                    ),
                    const Gap(25),
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
              CustomKeyboard(
                devise: 'WC',
                onChange: (value) {
                  // Mettre à jour une variable ou effectuer une action dans le parent
                  // print("Valeur mise à jour : $value");
                  setState(() {
                    _resultXof = _wcToXof(wc: value);
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
                      await Future.delayed(const Duration(seconds: 3));
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
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          controller: _scrollController,
          initialChildSize: 0.4, // Hauteur initiale
          minChildSize: 0.2, // Hauteur minimale
          maxChildSize: 1, // Hauteur maximale
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                controller: scrollController,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class Differences extends StatelessWidget {
  const Differences({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Constantes.greyColor, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: const Offset(0, 1),
            blurRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //padding: const EdgeInsets.all(8),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constantes.primaryColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icon/echanger.svg',
                width: 18,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const Gap(8.0),
          Expanded(
            child: Text(
              '1 WC = 25 000 XOF',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
