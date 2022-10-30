import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class BookingMoviesTypesItemView extends StatelessWidget {
  const BookingMoviesTypesItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            itemCount: 4,
            itemBuilder:(BuildContext context, int index){
              return BookingMoviesTypesView();
            }
        )
    );
  }
}

class BookingMoviesTypesView extends StatelessWidget {
  const BookingMoviesTypesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_SMALL),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(
              5.0
          ),
          border: Border.all(width: 1,color: Colors.white)
      ),
      child: TypeText("3D IMAX",Colors.white,TEXT_REGULAR,isFontWeight: true,),
    );
  }
}
