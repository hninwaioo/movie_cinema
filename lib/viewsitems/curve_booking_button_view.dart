import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/type_text.dart';

class CurveBookingButtonView extends StatelessWidget {

  String _btnText;
  Color _textColor;
  Color _bgColor;
  CurveBookingButtonView(this._btnText,this._textColor,this._bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(MARGIN_MEDIUM_2,0,MARGIN_MEDIUM_2,0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: _bgColor
              ),
            ),
          ),

          Positioned(
              top: 17.5,
              left: 0,
              right: 0,
              child: CustomDesignButtonView(_btnText,_textColor)
          )
        ],
      ),
    );
  }
}

class CustomDesignButtonView extends StatelessWidget {

  String _btn_text;
  Color _text_color;
  CustomDesignButtonView(this._btn_text,this._text_color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 15,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20)),
                  color: PRIMARY_COLOR
              ),
            ),
          ),

          Positioned(
              left: 10,
              right: 10,
              child: TypeText(_btn_text,_text_color,TEXT_REGULAR_1X,isFontWeight: true,)
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 15,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20)),
                  color: PRIMARY_COLOR
              ),
            ),
          ),
        ],
      ),
    );
  }
}