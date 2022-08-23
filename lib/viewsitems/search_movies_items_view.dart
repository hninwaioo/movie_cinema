import 'package:flutter/material.dart';
import '../resources/dimens.dart';
import 'movies_list_view.dart';

class SearchMoviesItemsView extends StatelessWidget {

  final Function onTapMovie;
  SearchMoviesItemsView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8.0),
        )
      ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviesItemImages(
              "https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",
            ),
            SizedBox(height: MARGIN_MEDIUM,),
            MoviesTypeView()
          ],
      ),
    );
  }
}


