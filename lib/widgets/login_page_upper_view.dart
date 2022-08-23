import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class LoginPageUpperView extends StatelessWidget {
  final String text_verify;
  final String text_sms_code;

  LoginPageUpperView(
      this.text_verify,
      this.text_sms_code
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo_icon.png',
              height: 100,
            ),
          ),

          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          Center(
            child: Text(
              text_verify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),

          SizedBox(height: MARGIN_MEDIUM_2,),
          Center(
            child: Text(
              text_sms_code,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: PRIMARY_HINT_COLOR,
                fontSize: TEXT_REGULAR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
