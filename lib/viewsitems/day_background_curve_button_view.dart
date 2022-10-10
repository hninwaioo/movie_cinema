import 'package:flutter/material.dart';

import '../data/vos/seven_days_date_vo.dart';
import '../resources/colors.dart';
import '../widgets/type_text.dart';
import '../resources/dimens.dart';

class DayBackgroundCurveButtonView extends StatelessWidget {
  SevenDaysDateVO? sevenDaysDateVO;

  DayBackgroundCurveButtonView({required this.sevenDaysDateVO});
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
              height: 13,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20)),
                  color: PRIMARY_COLOR
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 13,
              width: 26,
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


class WholeBackground extends StatefulWidget {
  bool selectedColor;
  SevenDaysDateVO? sevenDaysDateVO;
  Function (String) selectedDateTime;

  WholeBackground({
    required this.selectedColor,
    required this.sevenDaysDateVO,
    required this.selectedDateTime,
  });
  @override
  State<WholeBackground> createState() => _WholeBackgroundState();
}

class _WholeBackgroundState extends State<WholeBackground> {

  Color? _color;
  // @override
  // void initState(){
  //   super.initState();
  //   print("WIDGETCOLOR=>${widget.sevenDaysDateVO?.selectedDate}");
  //   if(widget.selectedColor == true){
  //     _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
  //   }else{
  //     _color = Colors.white;
  //   }
  //
  //   // setState((){
  //   //   if(widget.sevenDaysDateVO?.selectedDate == true){
  //   //     _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
  //   //   }else{
  //   //     _color = Colors.white;
  //   //   }
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.selectedDateTime(widget.sevenDaysDateVO?.completeDate??"");
        print("onTapObject=>${widget.sevenDaysDateVO?.selectedDate}");
        print("onTapObject==>${widget.selectedColor}");

        setState((){
          if(widget.selectedColor == true){
            _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
          }else{
            _color = Colors.white;
          }
        });
      },
      child:  Container(
        width: 130,
        height: 110,
        child: Stack(
          children: [

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 140,
                margin: EdgeInsets.fromLTRB(MARGIN_MEDIUM_2,0,MARGIN_MEDIUM_2,0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // color: _color
                    color: widget.selectedColor == false ? Colors.white : SIGN_PHONE_NUMBER_BUTTON_COLOR
                ),
              ),
            ),

            Positioned(
                top: 20,
                left: -10,
                right: -10,
                child:
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(3),bottom: Radius.circular(3)),
                        color: PRIMARY_COLOR
                    ),
                  ),
                )
            ),

            Align(
              alignment: Alignment.center,
              child:
              Container(
                padding: EdgeInsets.only(top: 36),
                child: Column(
                  children: [
                    TypeText(widget.sevenDaysDateVO?.day??"", PRIMARY_COLOR, TEXT_REGULAR_1X,isFontWeight: true),
                    SizedBox(height: MARGIN_MEDIUM,),
                    TypeText(widget.sevenDaysDateVO?.month??"", PRIMARY_COLOR, TEXT_REGULAR_1X,isFontWeight: true),
                    SizedBox(height: MARGIN_MEDIUM,),
                    TypeText(widget.sevenDaysDateVO?.dayDate??"", PRIMARY_COLOR, TEXT_REGULAR_1X,isFontWeight: true)

                  ],
                )

              )
            ),

            Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: DayBackgroundCurveButtonView(sevenDaysDateVO: widget.sevenDaysDateVO,)
            )
          ],
        ),
      ),
    );
  }
}
