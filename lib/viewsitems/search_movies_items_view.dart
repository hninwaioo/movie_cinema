import 'package:flutter/material.dart';
import '../pages/movies_detail_page.dart';
import '../resources/dimens.dart';
import 'movies_list_view.dart';

class SearchMoviesItemsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _navigateToMoviesDetailScreen(context);
      },
      child: Container(
        height: 270,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(8.0),
            )
        ),

        child: Wrap(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviesItemImages(
              "https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",
            ),
            SizedBox(height: MARGIN_MEDIUM,),
            MoviesTypeView(),


          ],
        ),
      ),
    );

  }

  Future<dynamic> _navigateToMoviesDetailScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => MoviesDetailPage()
    )
    );
  }
}


