import 'package:flutter/material.dart';
import '../resources/dimens.dart';

class NowShowingMoviesView extends StatelessWidget {

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
          // child: SearchMoviesItemsView(),
        );
      }),
    ),
    );
  }

}
