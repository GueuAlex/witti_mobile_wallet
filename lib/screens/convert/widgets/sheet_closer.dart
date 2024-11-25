import 'package:flutter/material.dart';

import '../../../config/constantes.dart';

class SheetCloser extends StatelessWidget {
  const SheetCloser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Constantes.greyColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                size: 16,
                Icons.close,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
