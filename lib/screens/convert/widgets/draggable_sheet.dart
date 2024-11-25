import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';
import 'package:witti/screens/convert/widgets/sheet_closer.dart';

import '../../../widgets/text_middle.dart';
import 'product_card.dart';
import 'voucher.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key, this.voucherValue = ''});
  final String voucherValue;

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final _scrollController = DraggableScrollableController();
  bool isMaxHeight = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      // print(_scrollController.size);
      double currentExtent = _scrollController.size;
      double maxExtent = 1.0;
      setState(() {
        isMaxHeight = currentExtent >= maxExtent * 0.8;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _scrollController,
      shouldCloseOnMinExtent: false,
      snap: true,
      snapSizes: const [0.6, 1],
      initialChildSize: 0.6, // Hauteur initiale
      minChildSize: 0.6, // Hauteur minimale
      maxChildSize: 1, // Hauteur maximale
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            //physics: const NeverScrollableScrollPhysics(),
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // const SheetCloser(),
                  if (!isMaxHeight) const Gap(15),
                  if (!isMaxHeight) Voucher(value: widget.voucherValue),
                  if (!isMaxHeight)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 25,
                      ),
                      child: textMidleLine(text: 'ou'),
                    ),
                  if (isMaxHeight) const Gap(kToolbarHeight),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prendre des articles',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //_showCustomSnackbar(context);
                                  if (isMaxHeight) {
                                    _setDraggableToMinSize();
                                  } else {
                                    _setDraggableToMaxSize();
                                  }
                                },
                                child: Text(
                                  isMaxHeight ? 'Reduire' : 'Voir plus',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.spaceGrotesk(
                                    color:
                                        const Color.fromARGB(255, 96, 96, 96),
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (!isMaxHeight)
                            Column(
                              children: [
                                Column(
                                  children: Constantes.products
                                      .sublist(0, 2)
                                      .map(
                                        (product) =>
                                            ProductCard(product: product),
                                      )
                                      .toList(),
                                ),
                                const Gap(15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 50),
                                  child: Container(),
                                ),
                                const SheetCloser()
                              ],
                            )
                          else
                            SingleChildScrollView(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: Constantes.products
                                      .map(
                                        (product) =>
                                            ProductCard(product: product),
                                      )
                                      .toList(),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _setDraggableToMinSize() {
    _scrollController.animateTo(
      0.6,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _setDraggableToMaxSize() {
    _scrollController.animateTo(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
