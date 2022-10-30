import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/payment_view_page.dart';
import 'package:movie_cinema/pages/ticket_detail_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/snack/add_snack_list_vo.dart';
import '../view_items/curve_booking_button_view.dart';

class CheckOutDialogViewPage extends StatefulWidget{

  String? cinemaName;
  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;
  List<AddSnackListVO>? addSnackListVO;

  CheckOutDialogViewPage({
    required this.cinemaName,
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate,
    required this.addSnackListVO});

  @override
  State<CheckOutDialogViewPage> createState() => _CheckOutDialogViewPageState();
}

class _CheckOutDialogViewPageState extends State<CheckOutDialogViewPage> {

  @override
  void initState(){
    super.initState();
    print("CheckSnackList=>${widget.addSnackListVO}");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),

        title: Center(
          child: TypeText("Checkout", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
        )
      ),

      body: Column(
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          Expanded(
            child: ListView(
              children: [
                TicketDetailPage(
                  TICKET_CANCELION_POLICY,
                  TICKET_POLICY,
                  cinemaName: widget.cinemaName,
                  mMovieVO: widget.mMovieVO,
                  cinemaDayTimeSlots: widget.cinemaDayTimeSlots,
                  startTime: widget.startTime,
                  completeDate: widget.completeDate,
                  addSnackListVO: widget.addSnackListVO,),
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),

          GestureDetector(
              onTap: (){
                _navigateToPaymentScreen(context,
                widget.cinemaName,
                widget.mMovieVO,
                widget.cinemaDayTimeSlots??0,
                widget.startTime??"",
                widget.completeDate??"",
                widget.addSnackListVO);
              },
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
                  child: CurveBookingButtonView("Continue",Colors.black,SIGN_PHONE_NUMBER_BUTTON_COLOR))

          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),

        ],
      ),
    );
  }

  Future<dynamic> _navigateToPaymentScreen(
      BuildContext context,
      String? cinemaName,
      MovieVO? mMovieVO,
      int cinemaDayTimeSlots,
      String startTime,
      String completeDate,
      List<AddSnackListVO>? addSnackListVO
      ) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => PaymentViewPage(
          cinemaName: cinemaName,
          mMovieVO: mMovieVO,
          cinemaDayTimeSlots: cinemaDayTimeSlots,
          startTime: startTime,
          completeDate: completeDate,
          addSnackListVO: addSnackListVO,
        )
    )
    );
  }
}

class TermsAndPolicyViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          NormalText("Ticket Cancelation Policy", Colors.white, TEXT_REGULAR_1X),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          ImageTextView("assets/images/online_food_icon.png","100% Refund on F&B"),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          ImageTextView("assets/images/ticket_white.png","Up to 75% Refund for ticket"),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          Container(
            margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              child: NormalText("-75% refund until 2 hours before show start time", PRIMARY_HINT_COLOR, TEXT_REGULAR)
          ),
          SizedBox(height: MARGIN_MEDIUM,),

          Container(
              margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              child: NormalText("-50% refund between 2 hours and 20 minutes before show start time", PRIMARY_HINT_COLOR, TEXT_REGULAR)
          ),

          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          NormalText("1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.", Colors.white, TEXT_REGULAR),
          SizedBox(height: MARGIN_MEDIUM_2,),
          NormalText("2. No cancelation within 20minute of show start time.", Colors.white, TEXT_REGULAR),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),

          ElevatedButton(
              onPressed: (){

                // _navigateToSuccessBookingScreen(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,45),
                primary: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: TypeText("Close",Colors.black,TEXT_REGULAR_1X)
          ),

          SizedBox(height: MARGIN_MEDIUM_LARGE,),
        ],
      ),
    );
  }
}

class ImageTextView extends StatelessWidget {

  String _image;
  String _text;
  ImageTextView(this._image,this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(_image,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM,),
          TypeText(_text, Colors.white, TEXT_REGULAR_1X)
        ],
      ),
    );
  }
}

