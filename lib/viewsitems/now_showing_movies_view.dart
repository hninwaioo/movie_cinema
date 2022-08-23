import 'package:flutter/material.dart';
import 'package:movie_cinema/viewsitems/search_movies_items_view.dart';
import '../pages/movies_detail_page.dart';
import '../resources/dimens.dart';
import 'movies_list_view.dart';

class NowShowingMoviesView extends StatelessWidget {

  // final Function onTapMovie;
  // NowShowingMoviesView(this.onTapMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2 ,
      shrinkWrap: true,
      crossAxisSpacing: MARGIN_MEDIUM,
      mainAxisSpacing: MARGIN_MEDIUM,
      children: List.generate(4,(index){
        return Container(
          child: SearchMoviesItemsView(
                  ()=> _navigateToMoviesDetailScreen(context)

          ),
        );
      }),
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
