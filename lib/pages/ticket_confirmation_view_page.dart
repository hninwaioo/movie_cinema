import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/success_booking_view_page.dart';
import 'package:movie_cinema/pages/ticket_list_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class TicketConfirmationViewPage extends StatelessWidget {
  const TicketConfirmationViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        title: Center(
          child: TypeText("Ticket Confirmation",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MARGIN_MEDIUM_2),
        child: Column(
          children: [
            MoviesAboutViewList(),
            SizedBox(height: MARGIN_XLARGE,),
            ScanQRViewPage(),
            SizedBox(height: MARGIN_XLARGE,),

          ],
        ),
      ),
    );
  }
}

class ScanQRViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/payment_qr_code.png"),
        SizedBox(height: MARGIN_MEDIUM_2,),
        TypeText("WAG5LP1C", Colors.white, TEXT_REGULAR_3X,isFontWeight: true,),
        SizedBox(height: MARGIN_SMALL,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypeText("TPIN: ", PRIMARY_HINT_COLOR, TEXT_REGULAR_3X,isFontWeight: true,),
            TypeText("WKCSL96", Colors.white, TEXT_REGULAR_3X,isFontWeight: true,),
          ],
        ),
        SizedBox(height: MARGIN_XLARGE,),

        ElevatedButton(
            onPressed: (){

              _navigateToSuccessBookingScreen(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150,45),
              primary: SIGN_PHONE_NUMBER_BUTTON_COLOR,
              shape: RoundedRectangleBorder( //to set border radius to button
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: TypeText("DONE",Colors.black,TEXT_REGULAR_1X)
        )
      ],
    );
  }

  Future<dynamic> _navigateToSuccessBookingScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => SuccessBookingViewPage()
    )
    );
  }
}

