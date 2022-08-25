
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class TypeText extends StatelessWidget {
  final String text;
  final Color text_color;
  final double fontSize;
  final bool isFontWeight;
  TypeText(
      this.text,
      this.text_color,
      this.fontSize,
      {this.isFontWeight=false}
      );

  // const TitleText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: text_color,
          fontSize: fontSize,
          fontWeight: (isFontWeight)
              ?
              FontWeight.bold
              :
          null
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final Color text_color;
  final double fontSize;
  final bool isFontWeight;
  NormalText(
      this.text,
      this.text_color,
      this.fontSize,
      {this.isFontWeight=false}
      );

  // const TitleText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: text_color,
          fontSize: fontSize,
          fontWeight: (isFontWeight)
              ?
          FontWeight.bold
              :
          null
      ),
    );
  }
}

