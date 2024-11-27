import 'package:flutter/material.dart';
import 'package:witti/config/constantes.dart';

Container horizontalSeparator({
  double width = 60,
  double height = 2,
  Color color = Constantes.greyColor,
  double vpadding = 5,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: vpadding),
      width: width,
      height: height,
      color: color,
    );
