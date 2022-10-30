import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/snack_food_types_view_page.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../resources/colors.dart';
import '../view_items/curve_booking_button_view.dart';

class BuyingTicketForSeatViewPage extends StatelessWidget {

  String? cinemaName;
  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;
  BuyingTicketForSeatViewPage({
    required this.cinemaName,
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate
  });

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
      ),

      body: SingleChildScrollView(

        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child:  GestureDetector(
                  onTap: (){

                    _navigateToFoodSnackScreen(
                        context,
                        cinemaName??"",
                        mMovieVO,
                        cinemaDayTimeSlots??0,
                        startTime??"",
                        completeDate??"");
                  },
                  child: Container(
                      width: 200,
                      // MediaQuery.of(context).size.width/3,
                      child: CurveBookingButtonView("Buy Ticket",Colors.black,SIGN_PHONE_NUMBER_BUTTON_COLOR))
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _navigateToFoodSnackScreen(BuildContext context,
      String cinemaName,
      MovieVO? mMovieVO,
      int cinemaDayTimeSlots,
      String startTime,
      String completeDate) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => SnackFoodTypesViewPage(
          cinemaName: cinemaName,
          mMovieVO: mMovieVO,
          cinemaDayTimeSlots: cinemaDayTimeSlots,
          startTime: startTime,
          completeDate: completeDate,
        )
    )
    );
  }
}
