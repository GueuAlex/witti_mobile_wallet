import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/functions.dart';

class CustomKeyboard extends StatefulWidget {
  final Function(String)? onChange;
  final String devise;
  final bool withOutPut;
  final double keyboardPadding;

  const CustomKeyboard(
      {super.key,
      this.onChange,
      this.devise = "XOF",
      this.withOutPut = true,
      this.keyboardPadding = 0.0});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  String _output = ""; // Variable pour stocker les entrées

  void _onKeyPressed(String value) {
    setState(() {
      if (value == "back") {
        if (_output.isNotEmpty) {
          _output = _output.substring(0, _output.length - 1);
        }
      } else {
        _output += value;
      }

      // Appeler la fonction onChange pour notifier le parent
      widget.onChange?.call(_output);
    });
  }

  Widget _buildKey(String label, {bool isBackspace = false}) {
    return GestureDetector(
      onTap: () => _onKeyPressed(isBackspace ? "back" : label),
      child: Container(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isBackspace
            ? SvgPicture.asset('assets/icon/fleche-gauche.svg')
            : Text(
                label,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.withOutPut)
          Text(
            "${Functions.numberFormat(_output)} ${widget.devise}",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxHeight: 360),
          padding: EdgeInsets.symmetric(horizontal: widget.keyboardPadding),
          //height: 290,
          color: Colors.transparent,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              if (index == 9) {
                return const SizedBox
                    .shrink(); // Case vide pour équilibrer la disposition
              } else if (index == 10) {
                return _buildKey("0");
              } else if (index == 11) {
                return _buildKey("", isBackspace: true); // Touche retour
              } else {
                return _buildKey((index + 1).toString());
              }
            },
          ),
        ),
      ],
    );
  }
}
