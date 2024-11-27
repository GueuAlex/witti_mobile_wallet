import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/screens/convert/widgets/sheet_closer.dart';

import 'product_card.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({
    super.key,
    this.voucherValue = 0,
    this.cbons = const [],
  });
  final int voucherValue;
  final List<Map<String, dynamic>> cbons;

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
      snapSizes: const [0.4, 1],
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            children: [
              if (!isMaxHeight) const Gap(15),
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
                            'Articles & Bons',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
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
                                color: const Color.fromARGB(255, 96, 96, 96),
                              ),
                            ),
                          )
                        ],
                      ),
                      if (!isMaxHeight) ...[
                        if (widget.cbons.length > 3)
                          ...widget.cbons.sublist(0, 2).map(
                                (product) => ProductCard(product: product),
                              )
                        else
                          ...widget.cbons.map(
                            (product) => ProductCard(product: product),
                          ),
                        const Gap(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Container(),
                        ),
                        const SheetCloser()
                      ] else
                        ...widget.cbons.map(
                          (product) => ProductCard(product: product),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _setDraggableToMinSize() {
    _scrollController.animateTo(
      0.4,
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
