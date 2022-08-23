import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../widgets/gradient_for_movies_view.dart';

class MoviesItemImages extends StatelessWidget {
  final String movies_image;
  MoviesItemImages(this.movies_image);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0) ,topRight: Radius.circular(8.0)),
      child:
      Image.network(
        movies_image,
        height: MOVIE_LIST_ITEM_WIDTH,
        fit:BoxFit.cover,
        width: MOVIE_LIST_ITEM_WIDTH,

      )
    );
  }
}


class MoviesTypeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MOVIE_LIST_ITEM_WIDTH,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      child: Column(
        children: [
          Row(
            children: [
              TypeText("Minions", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
              Spacer(),
              Container(
                child: Row(
                  children: [
                    Image.asset("assets/images/images_im.png",width: 45,height: 35,),
                    TypeText("9.8", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              TypeText("U/A", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
              SizedBox(width: MARGIN_MEDIUM,),
              Image.asset("assets/images/ellipse.png"),
              SizedBox(width: MARGIN_MEDIUM,),
              TypeText("2D,3D,IMAX", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
            ],
          )
        ],
      ),
    );
  }
}

class NowShowingMoviesItemsView extends StatelessWidget{

  final Function onTapMovie;

  NowShowingMoviesItemsView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapMovie();
        print("movieItemTap");
      },
      child:  Container(
        child:  Stack(
          children: [
            Positioned.fill(
                child: MoviesItemImages("https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",

                )
            ),
            Positioned.fill(
                child: GradientForMoviesView()
            ),

          ],
        ),
      )
    );
  }
}

class ComingSoonMoviesItemsView extends StatelessWidget {

  final Function onTapMovie;

  ComingSoonMoviesItemsView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          onTapMovie();
          print("movieItemTap");
        },
        child:  Container(
          child:  Stack(
            children: [
              Positioned.fill(
                  child: MoviesItemImages("https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",
                  )
              ),
              Positioned.fill(
                  child: GradientForMoviesView()
              ),

              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(MARGIN_MEDIUM),
                  padding: EdgeInsets.fromLTRB(MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM, MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM),
                  decoration: BoxDecoration(
                      color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Text("8th\nAug",
                    style: TextStyle(
                        color: MOVIES_TAB_COLOR,
                        fontWeight: FontWeight.w500,
                        fontSize: TEXT_REGULAR_1X
                    ),),
                ),
              )
            ],
          ),
        ),
      );
  }
}



