import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:witti/config/constantes.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              /* width: 50,
              height: 50, */
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constantes.greyColor.withOpacity(0.25),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constantes.greyColor,
                  width: 1,
                ),
              ),
              child: SvgPicture.asset(
                'assets/icon/menu1.svg',
                width: 20,
              ),
            ),
            Image.asset(
              'assets/images/avatar.webp',
              width: 43,
            )
          ],
        ),
      ),
    );
  }
}
