import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import '../resources/colors.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(height: MARGIN_XLARGE),
          Center(
            child: Image.asset(
                'assets/images/logo_icon.png',
              height: 100,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          Center(
            child: Text(
              VERIFY_PHONE_NUMBER,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: TEXT_HEADING_1x,
                    fontWeight: FontWeight.w700
                  ),
            ),
          ),

          SizedBox(height: MARGIN_MEDIUM_2,),
          Center(
            child: Text(
              SMS_CODE,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: PRIMARY_HINT_COLOR,
                fontSize: TEXT_REGULAR,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                COUNTRY_CODE,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: PRIMARY_HINT_COLOR,
                  fontSize: TEXT_REGULAR
                ),
              ),

            ],
          ),
          PhoneNumberCodeSectionView()
        ],
      ),

    );
  }
}

class PhoneNumberCodeSectionView extends StatelessWidget {
  const PhoneNumberCodeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntlPhoneField(
          decoration: InputDecoration(
            // labelText: 'Mobile Number',
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(),
            // ),
          ),
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },

        ),
      ),

      // children: [
      //   Container(
      //     child: IntlPhoneField(
      //       decoration: InputDecoration(
      //         labelText: 'Mobile Number',
      //         border: OutlineInputBorder(
      //           borderSide: BorderSide(),
      //         ),
      //       ),
      //       onChanged: (phone) {
      //         print(phone.completeNumber);
      //       },
      //       onCountryChanged: (country) {
      //         print('Country changed to: ' + country.name);
      //       },
      //
      //     ),
      //   )
      // ],
    );
  }
}
