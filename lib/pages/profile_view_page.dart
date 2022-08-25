import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../resources/dimens.dart';
import 'login_view_page.dart';

class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              ProfileImageView(),
              SizedBox(height: MARGIN_MEDIUM_LARGE,),
              ProfileFeaturesView()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/images/profile_background.png",
              fit: BoxFit.cover,)
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: MARGIN_MEDIUM_LARGE,),
                Image.asset("assets/images/profile_circle.png",
                  height: 80,
                ),
                SizedBox(height: MARGIN_MEDIUM_LARGE,),
                GestureDetector(
                  onTap: (){
                    _navigateToLoginViewScreen(context);
                  },
                  child: Image.asset("assets/images/login_sign_in.png",),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _navigateToLoginViewScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginViewPage()
    )
    );
  }
}

class ProfileFeaturesView extends StatelessWidget {
  const ProfileFeaturesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FeaturesView(
              "assets/images/purchase_history.png",
              PROFILE_PURSHASE_HISTORY
          ),
          DividerView(),
          FeaturesView(
              "assets/images/offer_icon.png",
              PROFILE_OFFER
          ),
          DividerView(),
          FeaturesView(
              "assets/images/gift_card_icon.png",
              PROFILE_GIFT_CARD
          ),
          DividerView(),
          FeaturesView(
              "assets/images/location_icon.png",
              PROFILE_LOCATION
          ),
          DividerView(),
          FeaturesView(
              "assets/images/payment_icon.png",
              PROFILE_PAYMENT
          ),
          DividerView(),
          FeaturesView(
              "assets/images/help_support_icon.png",
              PROFILE_HELP_SUPPORT
          ),
          DividerView(),
          FeaturesView(
              "assets/images/logout_icon.png",
              PROFILE_LOGOUT
          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,)
        ],
      ),
    );
  }
}

class DividerView extends StatelessWidget {
  const DividerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
      child: Column(
        children: [
          SizedBox(height: MARGIN_MEDIUM,),
          Divider(
            color: PRIMARY_HINT_COLOR,
          ),
          SizedBox(height: MARGIN_MEDIUM,),
        ],
      )
    );
  }
}

class FeaturesView extends StatelessWidget {

  String _imageFeatures;
  String _textFeatures;
  FeaturesView(this._imageFeatures,this._textFeatures);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(_imageFeatures,height: 24,width: 24,),
              SizedBox(width: MARGIN_MEDIUM,),
              TypeText(_textFeatures, Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,
          color: MOVIES_TAB_COLOR,
          size: 20,)
        ],
      ),
    );
  }
}




