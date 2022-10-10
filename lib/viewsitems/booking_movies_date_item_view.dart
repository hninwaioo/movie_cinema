import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../data/vos/seven_days_date_vo.dart';
import 'day_background_curve_button_view.dart';

class BookingMoviesDateItemView extends StatelessWidget {

  bool selectedColor;
  List<SevenDaysDateVO>? sevenDaysDateList;
  Function (String) selectedDateTime;

  BookingMoviesDateItemView({
    required this.selectedColor,
    required this.sevenDaysDateList,
    required this.selectedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                itemCount: sevenDaysDateList?.length,
                itemBuilder:(BuildContext context, int index){
                  return WholeBackground(
                    selectedColor: selectedColor,
                    sevenDaysDateVO: sevenDaysDateList?[index],
                    selectedDateTime: selectedDateTime,
                  );
                }
            )
        );
  }
}

class BookingAvailableDateView extends StatefulWidget {

  SevenDaysDateVO? sevenDaysDateVO;
  Function (String) selectedDateTime;

  BookingAvailableDateView({
    required this.sevenDaysDateVO,
    required this.selectedDateTime,
  });

  @override
  State<BookingAvailableDateView> createState() => _BookingAvailableDateViewState();
}

class _BookingAvailableDateViewState extends State<BookingAvailableDateView> {
  Color _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
  @override
  void initState(){
    super.initState();
    print("WIDGETCOLOR=>${widget.sevenDaysDateVO?.selectedDate}");
    if(widget.sevenDaysDateVO?.selectedDate == true){
      _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
    }else{
      _color = Colors.white;
    }

    setState((){
      if(widget.sevenDaysDateVO?.selectedDate == true){
        _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
      }else{
        _color = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.selectedDateTime(widget.sevenDaysDateVO?.completeDate??"");
      },
      child: Container(
        // color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
        padding: EdgeInsets.all(MARGIN_MEDIUM),
        alignment: Alignment.center,
        width: 90,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: _color
        ),
        child: TypeText("${widget.sevenDaysDateVO?.day}\n${widget.sevenDaysDateVO?.month}\n${widget.sevenDaysDateVO?.dayDate}",Colors.black,TEXT_REGULAR,isFontWeight: true,),
      ),
    );
  }
}

