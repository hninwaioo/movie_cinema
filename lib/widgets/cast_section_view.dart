import 'package:flutter/material.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class CastSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      color: PRIMARY_COLOR,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText("Cast",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),

          SizedBox(height: MARGIN_MEDIUM_2,),
          Container(
            height: MOVIE_LIST_ITEM_WIDTH,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_SMALL),
              children: [
                CastView(),
                SizedBox(width: MARGIN_MEDIUM,),
                CastView(),
                SizedBox(width: MARGIN_MEDIUM,),
                CastView(),
                SizedBox(width: MARGIN_MEDIUM,),
                CastView(),
                SizedBox(width: MARGIN_MEDIUM,),
                CastView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CastView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
          NetworkImage(
            "https://w7.pngwing.com/pngs/157/256/png-transparent-minions-girl-others-boy-cartoon-fictional-character.png"
          ),
          radius: 50,
        ),
        SizedBox(height: MARGIN_MEDIUM,),
        TypeText("Ketty", Colors.white, TEXT_REGULAR,isFontWeight: true,)
      ],
    );

  }
}

