
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/ticket_list_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/strings.dart';

import '../resources/dimens.dart';
import '../widgets/type_text.dart';
import 'check_out_view_page.dart';

class TicketDetailViewPage extends StatelessWidget {

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
              child: TypeText("Ticket Details",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,)

          )
      ),
      body: SingleChildScrollView(

        child: Column(
        
          children: [
            SizedBox(height: MARGIN_MEDIUM_2,),

            TicketDetailPage(SET_NOTIFICATION,TICKET_CANCEL_COLOR),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            CancelBookingView(),
            SizedBox(height: MARGIN_MEDIUM_2,),

          ],
        ),
      ),
    );
  }
}

class TicketDetailPage extends StatelessWidget {
  String _text;
  Color _btnColor;
  TicketDetailPage(this._text,this._btnColor);
  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.all(MARGIN_MEDIUM_LARGE),
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(68, 68, 68, 1.0),
                  Color.fromRGBO(34, 34, 34, 1.0),
                  Color.fromRGBO(68, 68, 68, 1.0),
                ]
            )
        ),

      child: Container(
        child: Column(
          children: [

            SizedBox(height: MARGIN_MEDIUM_2,),
            Row(
              children: [
                TypeText("Minions", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                TypeText("(3D)(U/A)", Colors.white, TEXT_REGULAR_1X,isFontWeight: false,),

              ],
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
            Row(
              children: [
                TypeText("JCGV:Junction City", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
                TypeText("(Screen 2)", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),

            MoviesDateTimeLocation(),
            SizedBox(height: MARGIN_MEDIUM_2,),
            M_TicketView(),
            SizedBox(height: MARGIN_MEDIUM,),
            Row(
              children: [
                TypeText("Gold-G8,G7", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                Spacer(),
                TypeText("30000 Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
            Divider(
              color: PRIMARY_HINT_COLOR,
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
            FoodAndBeverageViewpage(),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            DottedLine(dashLength: 10, dashGapLength: 10,dashColor: PRIMARY_HINT_COLOR),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            ConvenienceFeeView(_text,_btnColor),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            Divider(
              color: PRIMARY_HINT_COLOR,
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),

            TotalChargesView(),
            SizedBox(height: MARGIN_MEDIUM_2,),

          ],
        ),
      ),
      
    );
  }
}

class FoodAndBeverageViewpage extends StatelessWidget {
  const FoodAndBeverageViewpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/online_food_icon.png",color: Colors.white,
                    height: 30,width: 24,),
                    SizedBox(width: MARGIN_SMALL,),
                    TypeText("Food and Beverage", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                    SizedBox(width: MARGIN_MEDIUM,),
                    Image.asset("assets/images/down_arrow_icon.png",color: Colors.white,)

                  ]
              ),
              Spacer(),
              TypeText("3000 Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
          FoodTypesView("Potato Chips(Qt.1)","1500 Ks"),
          SizedBox(height: MARGIN_MEDIUM,),

          FoodTypesView("Cocacola Large(Qt.1)","1500 Ks"),

          // ListView(
          //   scrollDirection: Axis.vertical,
          //   padding: EdgeInsets.only(left: MARGIN_SMALL),
          //   children: [
          //     FoodTypesView(),
          //     SizedBox(width: MARGIN_MEDIUM,),
          //   ],
          // ),
        ],
      )

    );
  }
}

class FoodTypesView extends StatelessWidget {

  String _textFood;
  String _textPrice;
  FoodTypesView(this._textFood,this._textPrice);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              Image.asset("assets/images/food_cancel_icon.png"),
              SizedBox(width: MARGIN_MEDIUM,),
              TypeText(_textFood, PRIMARY_HINT_COLOR, TEXT_REGULAR)
            ],
          ),
          Spacer(),
          TypeText(_textPrice, PRIMARY_HINT_COLOR, TEXT_REGULAR)
        ],
      ),
    );
  }
}

class ConvenienceFeeView extends StatelessWidget {

  String _text;
  Color _btnColor;

  ConvenienceFeeView(this._text,this._btnColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  TypeText("Convenience Fee", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                  SizedBox(width: MARGIN_MEDIUM,),
                  Image.asset("assets/images/down_arrow_icon.png",color: Colors.white,)
                ],
              ),
              Spacer(),
              TypeText("500 Ks", PRIMARY_HINT_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
            ],
          ),

          SizedBox(height: MARGIN_MEDIUM,),

          ElevatedButton.icon(// <-- ElevatedButton
              onPressed: () {
                // showDialog(context: context, builder: builder)

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        elevation: 10,
                        shape: RoundedRectangleBorder(

                            borderRadius:
                            BorderRadius.circular(30.0)), //this right here
                        child: Container(
                          height: 450,
                          child: TermsAndPolicyViewPage()
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 24.0,
              ),
              label: Text(_text,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _btnColor,
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(30)
                ),

              )
          ),
        ],
      ),
    );
  }
}

class TotalChargesView extends StatelessWidget {
  const TotalChargesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TypeText("Total", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
          Spacer(),
          TypeText("33500 Ks", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,)
        ],
      ),
    );
  }
}

class CancelBookingView extends StatelessWidget {
  const CancelBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeText("Refund Amount", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              TypeText("15000 Ks", TICKET_CANCEL_COLOR, TEXT_REGULAR_1X,isFontWeight: true,)
            ],
          ),
          Spacer(),
          Image.asset("assets/images/cancel_book_button.png",
          width: 190,)
        ],
      ),
    );
  }
}



