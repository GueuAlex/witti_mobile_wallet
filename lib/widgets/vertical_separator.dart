import 'package:flutter/material.dart';
import 'package:witti/config/constantes.dart';

Container verticalSeparator({
  double height = 25,
  double width = 2,
  Color color = Constantes.greyColor,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    width: width,
    height: height,
    color: color,
  );
}
