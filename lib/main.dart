import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/FunnyContainer.dart';
import 'package:movie_cinema/pages/booking_movies_view_page.dart';
import 'package:movie_cinema/pages/check_out_view_page.dart';
import 'package:movie_cinema/pages/choose_location_view_page.dart';
import 'package:movie_cinema/pages/get_otp_view_page.dart';
import 'package:movie_cinema/pages/home_navidation_view_page.dart';
import 'package:movie_cinema/pages/login_view_page.dart';
import 'package:movie_cinema/pages/movies_detail_page.dart';
import 'package:movie_cinema/pages/profile_view_page.dart';
import 'package:movie_cinema/pages/search_movies_view_page.dart';
import 'package:movie_cinema/pages/snack_food_types_view_page.dart';
import 'package:movie_cinema/pages/start_view_page.dart';
import 'package:movie_cinema/pages/ticket_detail_view_page.dart';
import 'package:movie_cinema/pages/ticket_list_view_page.dart';
import 'package:movie_cinema/viewsitems/search_movies_items_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FunnyContainer(),
    );
  }
}


//physics : NeverScrollableScrollPhysics
//neverscrollablescrollphysics in flutter
//maxChildExtent : in flutter


