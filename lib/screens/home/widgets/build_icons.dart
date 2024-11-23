import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../config/constantes.dart';

class BuildIcons extends StatelessWidget {
  const BuildIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 12,
            color: Constantes.blackColor,
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
          const Gap(3),
          Container(
            width: 3,
            height: 6,
            color: const Color.fromARGB(255, 209, 209, 209),
          )
        ],
      ),
    );
  }
}
