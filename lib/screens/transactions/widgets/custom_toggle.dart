import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:witti/config/constantes.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  //
  String value = '1M';
  List<String> values = const ['1W', '1M', '3M', '2Y', 'ALL'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Constantes.greyColor.withOpacity(1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: values.map((v) {
          bool isSelected = value == v;
          return Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : null,
                borderRadius: BorderRadius.circular(25),
                // applique un box
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() => value = v),
                child: Text(
                  v,
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
