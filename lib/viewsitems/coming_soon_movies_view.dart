import 'package:flutter/material.dart';

import '../resources/dimens.dart';
import '../widgets/gradient_for_movies_view.dart';
import 'movies_list_view.dart';

class ComingSoonMoviesView extends StatelessWidget {
  final Function onTapMovie;
  ComingSoonMoviesView(this.onTapMovie);
  @override
  Widget build(BuildContext context) {
    return   Container(
      // height: 200,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2 ,
          shrinkWrap: true,
          crossAxisSpacing: MARGIN_MEDIUM,
          mainAxisSpacing: MARGIN_MEDIUM,
          children: List.generate(4,(index){
            return Container(
              child: ComingSoonMoviesItemsView(
                  (){
                    onTapMovie;
                  }
              ),

            );
          }),
        )
    );
  }
}
