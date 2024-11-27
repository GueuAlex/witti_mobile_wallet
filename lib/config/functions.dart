import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Functions {
  static String numberFormat(String input) {
    // Supprimer les espaces et vérifier si l'entrée est un nombre valide
    String cleanedInput = input.replaceAll(' ', '');

    // Supprimer le ".0" à la fin de la chaîne si présent
    if (cleanedInput.endsWith('.0')) {
      cleanedInput = cleanedInput.substring(0, cleanedInput.length - 2);
    }

    // Convertir la chaîne nettoyée en entier
    int? number = int.tryParse(cleanedInput);

    // Si la conversion réussit, formater avec des espaces
    if (number != null) {
      final formattedNumber = NumberFormat('#,###', 'fr_FR').format(number);
      return formattedNumber.replaceAll(',', ' ');
    }

    // Si la conversion échoue, renvoyer la chaîne d'origine
    return input;
  }

  static TextField getTextField({
    required TextEditingController controller,
    required String textFieldLabel,
    TextInputType keyboardType = TextInputType.name,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
    bool obscureText = false,
    Widget? prefix,
    Color hintColor = Colors.grey,
    void Function(String)? onChanged,
  }) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefix: prefix,
        contentPadding: const EdgeInsets.only(bottom: 12),
        hintText: textFieldLabel,
        hintStyle: GoogleFonts.spaceGrotesk(color: hintColor),

        /* label: AppText.medium(
          textFieldLabel,
          color: Colors.grey.withOpacity(0.5),
        ), */
        border: InputBorder.none,
      ),
    );
  }

  // Fonction pour formater l'entrée au fur et à mesure
  static void formatPhoneNumber(
    TextEditingController controller,
    String value,
  ) {
    // Supprimez tous les espaces pour travailler avec un format brut
    String formatted = value.replaceAll(' ', '');

    // Ajoutez des espaces tous les deux caractères
    String newText = '';
    for (int i = 0; i < formatted.length; i++) {
      if (i > 0 && i % 2 == 0) {
        newText += ' ';
      }
      newText += formatted[i];
    }

    // Mettre à jour le contrôleur sans déclencher une boucle infinie
    controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  static Future<void> showSimpleBottomSheet({
    required BuildContext ctxt,
    required Widget widget,
  }) async {
    return await showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      context: ctxt,
      builder: (context) {
        return widget;
      },
    );
  }
}
