import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import '../resources/colors.dart';
import '../widgets/login_page_upper_view.dart';
import '../widgets/type_text.dart';
import 'get_otp_view_page.dart';

class LoginViewPage extends StatelessWidget {

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

            LoginPageUpperView(VERIFY_PHONE_NUMBER,SMS_CODE),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            PhoneNumberCodeSectionView(),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            GestureDetector(
              onTap: (){
                _navigateToGetOTPScreen(context);
              },
              child:  LoginButtonScreenButtonView(
                VERIFY_PHONE_NUMBER,
                SIGN_PHONE_NUMBER_BUTTON_COLOR,
              ),
            ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            DividerORSectionView(),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            SignWithGoogleSectionView(),

            SizedBox(height: MARGIN_XXLARGE,),

            TermsPolicySectionView(),
            SizedBox(height: MARGIN_XLARGE,),

          ],
        ),
      ),
    );
  }

  Future<dynamic> _navigateToGetOTPScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => GetOTPViewPage()
    )
    );
  }
}

class PhoneNumberCodeSectionView extends StatelessWidget {
  const PhoneNumberCodeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText(COUNTRY_CODE, PRIMARY_HINT_COLOR, TEXT_REGULAR),
          Container(
            child: IntlPhoneField(

              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(Icons.arrow_drop_down,),
              showCountryFlag: false,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(
                  color: PRIMARY_HINT_COLOR
                ),
              ),
              initialCountryCode: 'MM',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SignWithGoogleSectionView extends StatelessWidget {
  const SignWithGoogleSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            MARGIN_MEDIUM
        ),

      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google_icon.png"),
            SizedBox(width: MARGIN_SMALL,),
            Flexible(
              child:Text(
                CONTINUE_WITH_GOOGLE,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DividerORSectionView extends StatelessWidget {
  const DividerORSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                color: PRIMARY_HINT_COLOR,
                height: 0.5,
              ),
          ),
          SizedBox(width: MARGIN_MEDIUM,),
          Text(
              "or",
          style: TextStyle(color: Colors.white,
          fontSize: TEXT_REGULAR_SMALL),
          ),
          SizedBox(width: MARGIN_MEDIUM,),
          Expanded(
            child: Divider(
              color: PRIMARY_HINT_COLOR,
              height: 0.5,
            ),

          ),
        ],
      ),
    );
  }
}

class TermsPolicySectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child :
          Wrap(
            children: [
              TypeText(
                BY_CLICK_ACCEPT,
                PRIMARY_HINT_COLOR,
                TEXT_REGULAR_VERY_SMALL,
              ),
              TypeText(
                TERMS_CONDITIONS,
                PRIMARY_HINT_COLOR,
                TEXT_REGULAR_VERY_SMALL,
                isFontWeight: true,
              ),
              TypeText(
                "&",
                PRIMARY_HINT_COLOR,
                TEXT_REGULAR_VERY_SMALL,
              ),
              TypeText(
                PRIVACY_POLICY,
                PRIMARY_HINT_COLOR,
                TEXT_REGULAR_VERY_SMALL,
                isFontWeight: true,
              )
            ],
          )
      // Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     TypeText(
      //       BY_CLICK_ACCEPT,
      //       PRIMARY_HINT_COLOR,
      //       TEXT_REGULAR_SMALL,
      //     ),
      //     TypeText(
      //       TERMS_POLICY,
      //       PRIMARY_HINT_COLOR,
      //       TEXT_REGULAR,
      //       isFontWeight: true,
      //     )
      //   ],
      // ),

    );
  }
}

class LoginButtonScreenButtonView extends StatelessWidget {

  final String btnText;
  final Color backgroundColor;

  LoginButtonScreenButtonView(
      this.btnText,
      this.backgroundColor,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
              MARGIN_MEDIUM
          ),

      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child:Text(
                btnText,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

