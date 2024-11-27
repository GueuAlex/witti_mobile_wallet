import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:witti/config/functions.dart';
import 'package:witti/widgets/custom_button.dart';

import '../../config/constantes.dart';
import '../../widgets/go_back.dart';
import '../convert/widgets/product_card.dart';

class PanierScreen extends StatefulWidget {
  static const routeName = '/PanierScreen';
  const PanierScreen({super.key});

  @override
  State<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GoBack(
            text: 'vous avez sélectionner',
          ),
          //GiftCards(),
          Expanded(
            child: SmartRefresher(
              //onLoading: () => ,
              onRefresh: _onRefresh,
              enablePullDown: true,
              enablePullUp: false,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              header: const ClassicHeader(
                completeText: "",
                idleText: "",
                refreshingText: "",
                releaseText: "",
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Constantes.data
                        .sublist(0, 20)
                        .map(
                          (product) => ProductCard(
                            product: product,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'Total à deduire',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        '${Functions.numberFormat('4500')} JW',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                          decorationColor:
                              const Color.fromARGB(255, 231, 161, 47),
                        ),
                      )),
                    ],
                  ),
                  const Gap(20),
                  CustomButton(
                      color: Constantes.primaryColor,
                      width: double.infinity,
                      height: 50,
                      radius: 25,
                      text: 'Valider le panier',
                      onPress: () async {
                        await Future.delayed(const Duration(seconds: 5));
                      }),
                ],
              ),
            ),
          ),
          const Gap(25),
        ],
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 5));
    _controller.refreshCompleted();
  }
}
