import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:movie_cinema/network/responses/get_otp_response.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import '../data/function/show_load_dialog.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../resources/colors.dart';
import '../widgets/login_page_upper_view.dart';
import '../widgets/type_text.dart';
import 'get_otp_view_page.dart';

class LoginViewPage extends StatefulWidget {

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  MovieModel mMovieModel = MovieModelImpl();
  OTPResponse? _otpResponse;

  late String _phoneNo;
  // late String _countryCode;
  late String _completePhoneNumber;

  void _getOTPRequest(String phoneNo){
    print("Value_Phone==>$phoneNo");

    mMovieModel.getOTP(phoneNo)?.then((value) {
      setState((){
        _completePhoneNumber = phoneNo;
        print("Value=>$_completePhoneNumber");

        if(value.code == 200){
          Navigator.pop(context);
          _navigateToGetOTPScreen(context,_completePhoneNumber);
        }
      });
    }).catchError((error){
      Navigator.pop(context);
      debugPrint("ERROR=>${error.toString()}");
    });
  }



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

            // PhoneNumberCodeSectionView(phoneNo: _phoneNo,),

            Container(

              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeText(COUNTRY_CODE, PRIMARY_HINT_COLOR, TEXT_REGULAR),
                  Container(
                    child: IntlPhoneField(
                      dropdownIconPosition: IconPosition.trailing,
                      dropdownIcon: Icon(Icons.keyboard_arrow_down,color: PRIMARY_HINT_COLOR,),
                      showCountryFlag: false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(
                          color: PRIMARY_HINT_COLOR
                      ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //
                    //     color: Colors.teal,
                    //   ),
                    // ),
                    ),
                    initialCountryCode: 'MM',
                    initialValue: '95',
                    cursorColor: PRIMARY_HINT_COLOR,

                    onChanged: (phone) {
                      _phoneNo = phone.number;
                      print(phone.number);
                    },
                    onCountryChanged: (country) {

                        // _countryCode = country.dialCode;
                      print('Country changed to: ' + country.dialCode);

                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),
              ],
            ),
          ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            GestureDetector(
              onTap: (){
                // _navigateToGetOTPScreen(context);
                showLoginDialog(context);
                _completePhoneNumber = "09${_phoneNo}";

                print("CompleteValuePhone====>$_completePhoneNumber");
                _getOTPRequest(_completePhoneNumber);

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

  Future<dynamic> _navigateToGetOTPScreen(BuildContext context,String phoneNo) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => GetOTPViewPage(phoneNo: phoneNo,)
    )
    );
  }
}

class PhoneNumberCodeSectionView extends StatelessWidget {

  String? phoneNo;
  PhoneNumberCodeSectionView({this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return

      Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText(COUNTRY_CODE, PRIMARY_HINT_COLOR, TEXT_REGULAR),
          Container(
            child: IntlPhoneField(

              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(Icons.keyboard_arrow_down,color: PRIMARY_HINT_COLOR,),
              showCountryFlag: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(
                  color: PRIMARY_HINT_COLOR
                ),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(
                //
                //     color: Colors.teal,
                //   ),
                // ),
              ),
              initialCountryCode: 'MM',
              cursorColor: PRIMARY_HINT_COLOR,

              onChanged: (phone) {
                phoneNo = phone.completeNumber;
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

