import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/dimens.dart';

import '../resources/colors.dart';
import '../viewsitems/booking_movies_date_item_view.dart';
import '../viewsitems/booking_movies_types_item_view.dart';
import '../viewsitems/cinema_item_view.dart';
import 'home_navidation_view_page.dart';

class BookingMoviesViewPage extends StatelessWidget {
  const BookingMoviesViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        title: Container(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          BookingAppBarView()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            BookingMoviesDateItemView(),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            BookingMoviesTypesItemView(),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            AvailableMoviesView(),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            CinemaNameDetailView("JCGV:Junction City"),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Divider(
              color: PRIMARY_HINT_COLOR,
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            CinemaNameDetailView("JCGV:City Mall"),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Divider(
              color: PRIMARY_HINT_COLOR,
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            CinemaNameDetailView("Mingalar Cinema Gold Class"),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

          ],
        ),
      ),
    );
  }
}

class BookingAppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          LocationAppBarSectionView(),
          SizedBox(width: MARGIN_MEDIUM,),
          Icon(Icons.search_outlined,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM,),
          Icon(Icons.filter_list_alt,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM,),
        ],
      ),
    );
  }
}

class AvailableMoviesView extends StatelessWidget {
  const AvailableMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XLARGE,
      color: AVAILABLE_MOVIES_BACKGROUND_COLOR,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Row(
        children: [
          AvailableMoviesItems("Available",AVAILABLE_MOVIES_COLOR),
          Spacer(),
          AvailableMoviesItems("Filling",FILLING_MOVIES_COLOR),
          Spacer(),
          AvailableMoviesItems("Almost Full",ALMOSTFULL_MOVIES_COLOR)
        ],
      ),
    );
  }
}
class AvailableMoviesItems extends StatelessWidget {

  final Color _color;
  final String text;
  AvailableMoviesItems(this.text,this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset("assets/images/ellipse.png",color: _color,width: 6,height: 6,
          fit: BoxFit.cover,),
          SizedBox(width: MARGIN_SMALL,),
          Text(
            text,
            style: TextStyle(
              color: _color,
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR
            ),
          )
        ],
      ),
    );
  }
}








