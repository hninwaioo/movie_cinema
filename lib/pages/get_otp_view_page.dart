import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../resources/strings.dart';
import '../widgets/login_page_upper_view.dart';
import 'choose_location_view_page.dart';
import 'login_view_page.dart';

class GetOTPViewPage extends StatelessWidget {
  const GetOTPViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(MARGIN_XLARGE, MARGIN_XXLARGE, 0, MARGIN_MEDIUM_2),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            LoginPageUpperView(GET_OTP,OTP_CODE),
            SizedBox(height: MARGIN_XXLARGE,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_XLARGE),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeText(ENTER_OTP_CODE, PRIMARY_HINT_COLOR, TEXT_REGULAR_1X),
                  SizedBox(height: MARGIN_MEDIUM,),
                  Row(
                    children: [
                      EnterOTPCodeSectionView(),
                      Spacer(),
                      EnterOTPCodeSectionView(),
                      Spacer(),
                      EnterOTPCodeSectionView(),
                      Spacer(),
                      EnterOTPCodeSectionView(),
                      Spacer(),
                      EnterOTPCodeSectionView(),
                      Spacer(),
                      EnterOTPCodeSectionView()
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: MARGIN_MEDIUM_2,),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeText(DONT_SEND_OTP, Colors.white, TEXT_REGULAR_1X),
                  SizedBox(width: MARGIN_SMALL,),
                  TypeText(RESEND_CODE, SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X)
                ],
              ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            GestureDetector(
              onTap: (){
                _navigateToChooseLocationScreen(context);
              },
              child: LoginButtonScreenButtonView(
                CONFIRM_OTP,
                SIGN_PHONE_NUMBER_BUTTON_COLOR,
              ),
            ),
            // LoginButtonScreenButtonView(
            //   CONFIRM_OTP,
            //   SIGN_PHONE_NUMBER_BUTTON_COLOR,
            //   Icon(null),
            // ),

            SizedBox(height: MARGIN_XXLARGE,),

            TermsPolicySectionView(),
            SizedBox(height: MARGIN_XLARGE,),

          ],
        ),
      ),

    );
  }

  Future<dynamic> _navigateToChooseLocationScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChooseLocationViewPage()
    )
    );
  }
}

class EnterOTPCodeSectionView extends StatelessWidget {
  const EnterOTPCodeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      child:
      TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),

            filled: true,
            fillColor: Color.fromRGBO(255, 255, 255, 1.0),
            // hintText: "3",
            hintStyle: TextStyle(
                color: Color.fromRGBO(66, 81, 101, 1.0))),

      ),
    );
  }
}
