import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class BookingMoviesDateItemView extends StatelessWidget {
  const BookingMoviesDateItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                itemCount: 5,
                itemBuilder:(BuildContext context, int index){
                  return BookingAvailableDateView();
                }
            )
        );
  }
}

class BookingAvailableDateView extends StatelessWidget {
  const BookingAvailableDateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      padding: EdgeInsets.all(MARGIN_MEDIUM),
      alignment: Alignment.center,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white
      ),
      child: TypeText("Today\nMay\n8",Colors.black,TEXT_REGULAR_1X,isFontWeight: true,),
    );
  }
}

