import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Tdetails extends StatelessWidget {
  const Tdetails({
    super.key,
    required this.transaction,
  });
  final Map<String, dynamic> transaction;

  @override
  Widget build(BuildContext context) {
    final String date =
        DateFormat('EE d MMM yyyy', 'fr_FR').format(transaction['date']);
    bool isDeposit = transaction['type'] == 'Dépôt';
    return Column(
      children: [
        _row(title: 'Date & heure', value: '$date à ${transaction['heure']}'),
        _row(title: 'Statut', value: transaction['status']),
        _row(title: 'Montant', value: transaction['amount']),
        _row(title: 'Frais witti', value: '3 400 XOF'),
        if (transaction['status'] == 'Confirmé')
          _row(
            title: 'Jeton Witti',
            value: isDeposit ? '+23.45' : '-23.45',
            color: isDeposit ? Colors.green : Colors.red,
          ),
      ],
    );
  }

  Padding _row(
      {required String title,
      required String value,
      Color color = const Color.fromARGB(255, 28, 28, 28)}) {
    bool isStatus = title == 'Statut';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 14.5,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 127, 127, 127),
            ),
          ),
          !isStatus
              ? Text(
                  value,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                )
              : _getStatus(value),
        ],
      ),
    );
  }

  Widget _getStatus(String value) {
    if (value == 'Suspendu') {
      return Text(
        value,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 14.5,
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 227, 182, 2),
        ),
      );
    }
    if (value == 'Confirmé') {
      return Text(
        value,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 14.5,
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 0, 170, 0),
        ),
      );
    }
    return Text(
      value,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 14.5,
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(255, 185, 3, 3),
      ),
    );
  }
}
