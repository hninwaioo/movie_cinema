import 'package:flutter/material.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import '../network/api_constant.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class CastSectionView extends StatelessWidget {
  List<CreditCastVO>? castList;
  CastSectionView({required this.castList});

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
            child: (castList != null)
            ?
            // ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            //     itemCount: castList?.length,
            //     itemBuilder:(BuildContext context, int index){
            //       return Row(
            //         children: [
            //           CastView(mCreditCastVO: castList?[index]),
            //           SizedBox(width: MARGIN_MEDIUM_2,)
            //         ],
            //       );
            //     }
            // )

            ListView.builder(
              itemCount: castList?.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, i) => Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  CastView(mCreditCastVO: castList?.elementAt(i)),
                  SizedBox(width: MARGIN_MEDIUM_2,)
                ],
              ),
            )
                :
                Center(
                  child: CircularProgressIndicator(),
                )
          ),
          SizedBox(width: MARGIN_MEDIUM,),
        ],
      ),
    );
  }
}

class CastView extends StatelessWidget {

  CreditCastVO? mCreditCastVO;
  CastView({required this.mCreditCastVO});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
          NetworkImage(
            // "https://w7.pngwing.com/pngs/157/256/png-transparent-minions-girl-others-boy-cartoon-fictional-character.png"
              "$IMAGE_BASE_URL${mCreditCastVO?.profile_path}"
          ),
          radius: 35,
        ),
        SizedBox(height: MARGIN_MEDIUM,),
        Center(
          child: TypeText(mCreditCastVO?.original_name??"", Colors.white, TEXT_REGULAR,isFontWeight: true,),
        ),
      ],
    );

  }
}

