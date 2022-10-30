import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../resources/dimens.dart';

class SearchMoviesViewPage extends StatelessWidget {
  const SearchMoviesViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchMoviesView(),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
              child: Row(
                children: [
                  SearchMoviesTypesView("Generes"),
                  SizedBox(width: MARGIN_MEDIUM,),
                  SearchMoviesTypesView("Format"),
                  SizedBox(width: MARGIN_MEDIUM,),
                  SearchMoviesTypesView("Months")
                ],
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
                // child: SearchMoviesItemsView()
            )
          ],
        ),
      ),
    );
  }
}

class SearchMoviesView extends StatelessWidget {
  const SearchMoviesView({Key? key}) : super(key: key);

  get prefixIcon => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(MARGIN_MEDIUM_LARGE, MARGIN_XXLARGE, MARGIN_MEDIUM_LARGE, 0),

      child: Row(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: SEARCH_MOVIES,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_outlined,color: Colors.white,),
                    hintText: "search movies",
                    hintStyle: TextStyle(
                      color: PRIMARY_HINT_COLOR,
                    ),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Icon(Icons.filter_list_alt,color: SIGN_PHONE_NUMBER_BUTTON_COLOR,)
        ],
      ),
    );
  }
}

class SearchMoviesTypesView extends StatelessWidget {

  String search_items;
  SearchMoviesTypesView(this.search_items);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_SMALL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white
      ),
      child: Row(
        children: [
          TypeText(search_items, Colors.black, TEXT_REGULAR),
          SizedBox(width: MARGIN_SMALL,),
          Icon(Icons.arrow_drop_down_outlined)
        ],
      ),
    );
  }
}


