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
}
