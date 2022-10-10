import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../data/function/show_load_dialog.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../resources/strings.dart';
import '../widgets/login_page_upper_view.dart';
import 'choose_location_view_page.dart';
import 'login_view_page.dart';

class GetOTPViewPage extends StatefulWidget {

  String? phoneNo;
  GetOTPViewPage({this.phoneNo});

  @override
  State<GetOTPViewPage> createState() => _GetOTPViewPageState();
}

class _GetOTPViewPageState extends State<GetOTPViewPage> {
  MovieModel mMovieModel = MovieModelImpl();

  String? _phoneNo;
  String? _otpCode;

  void _signInWithPhoneNumber(String phoneNo,String otpCode){
    phoneNo = widget.phoneNo??"";
    mMovieModel.signInWithPhoneNumber(phoneNo,"123456")?.then((value) {
      print("PHONENO==>${phoneNo}");
      print("OTPCODE==>${otpCode}");

      setState((){
        _phoneNo = widget.phoneNo;
        print("PHONENO===>${_phoneNo}");

        _otpCode = otpCode;
        if(value.code == 201){
          Navigator.pop(context);
          _navigateToChooseLocationScreen(context);
          print("Value=>$value");
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

            LoginPageUpperView(GET_OTP,OTP_CODE),
            SizedBox(height: MARGIN_XXLARGE,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_XLARGE),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeText(ENTER_OTP_CODE, PRIMARY_HINT_COLOR, TEXT_REGULAR_1X),
                  SizedBox(height: MARGIN_MEDIUM,),
                  // Row(
                  //   children: [
                  //     EnterOTPCodeSectionView(),
                  //     Spacer(),
                  //     EnterOTPCodeSectionView(),
                  //     Spacer(),
                  //     EnterOTPCodeSectionView(),
                  //     Spacer(),
                  //     EnterOTPCodeSectionView(),
                  //     Spacer(),
                  //     EnterOTPCodeSectionView(),
                  //     Spacer(),
                  //     EnterOTPCodeSectionView()
                  //   ],
                  // ),


                  EnterOTPCodeSectionView(otpCode: _otpCode)
                  // OtpTextField(
                  //   numberOfFields: 4,
                  //   borderColor: Color(0xFF512DA8),
                  //   filled: true,
                  //   fillColor: Colors.white,
                  //   focusedBorderColor: PRIMARY_HINT_COLOR,
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   fieldWidth: 35.0,
                  //   //set to true to show as box or false to show as dash
                  //   showFieldAsBox: true,
                  //
                  //   //runs when a code is typed in
                  //   onCodeChanged: (String code) {
                  //     //handle validation or checks here
                  //   },
                  //   //runs when every textfield is filled
                  //   onSubmit: (String verificationCode){
                  //     showDialog(
                  //         context: context,
                  //         builder: (context){
                  //           return AlertDialog(
                  //             title: Text("Verification Code"),
                  //             content: Text('Code entered is $verificationCode'),
                  //           );
                  //         }
                  //     );
                  //   }, // end onSubmit
                  // ),

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
                showLoginDialog(context);
                _signInWithPhoneNumber(widget.phoneNo??"",_otpCode??"");
                // _navigateToChooseLocationScreen(context);
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

class EnterOTPCodeSectionView extends StatefulWidget {
  String? otpCode;
  EnterOTPCodeSectionView({this.otpCode});

  @override
  State<EnterOTPCodeSectionView> createState() => _EnterOTPCodeSectionViewState();
}

class _EnterOTPCodeSectionViewState extends State<EnterOTPCodeSectionView> {

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
      // height: 45,
      // width: 45,
      // child:
      // TextFormField(
      //   decoration: InputDecoration(
      //       contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      //
      //       filled: true,
      //       fillColor: Color.fromRGBO(255, 255, 255, 1.0),
      //       // hintText: "3",
      //       hintStyle: TextStyle(
      //           color: Color.fromRGBO(66, 81, 101, 1.0))),
      //
      // ),
        child: Form(

          key: formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 0),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                // obscureText: true,
                // obscuringCharacter: '*',
                // obscuringWidget: const FlutterLogo(
                //   size: 24,
                // ),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: PRIMARY_HINT_COLOR,
                  selectedColor: PRIMARY_HINT_COLOR,
                  inactiveColor: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    widget.otpCode = value;
                    print("WidgetOTPValue==>${widget.otpCode}");
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )
          ),

        ),
    );
  }
}
