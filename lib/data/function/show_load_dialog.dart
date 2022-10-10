import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';

import '../../resources/dimens.dart';

void showLoaderDialog(BuildContext context){
  Dialog alert=Dialog(
      backgroundColor: Colors.transparent,

    child: Row(
      children: [
        CircularProgressIndicator(

        ),
        // Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
      ],
    ),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

void showLoginDialog(BuildContext context){

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    content: Center(
      child: CircularProgressIndicator(
      //  SIGN_PHONE_NUMBER_BUTTON_COLOR
         valueColor: AlwaysStoppedAnimation<Color>(SIGN_PHONE_NUMBER_BUTTON_COLOR)
      ),
    ),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

void showCheckOutSuccess(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(30.0)), //this right here
          child: Container(
            // margin: EdgeInsets.all(MARGIN_XXLARGE),
            height: double.infinity,
            color: Colors.transparent,
            child: Image.asset("assets/images/success_booking.png"),
          )
        );
      });
}