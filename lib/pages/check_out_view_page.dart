
import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/ticket_detail_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class CheckOutViewPage extends StatelessWidget{

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
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: MARGIN_MEDIUM_2,),
      //
      //       TicketDetailPage(TICKET_CANCELION_POLICY,TICKET_POLICY),
      //       SizedBox(height: MARGIN_MEDIUM_LARGE,),
      //
      //       Image.asset("assets/images/continue_icon.png"),
      //       SizedBox(height: MARGIN_MEDIUM_LARGE,),
      //     ],
      //   ),
      // ),

      body: Column(
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          Expanded(
            child: ListView(
              children: [
                TicketDetailPage(TICKET_CANCELION_POLICY,TICKET_POLICY),
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          Image.asset("assets/images/continue_icon.png"),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
        ],
      ),
    );
  }
}