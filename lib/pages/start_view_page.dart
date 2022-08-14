import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../viewsitems/first_banner_view.dart';

class StartViewPage extends StatefulWidget {

  @override
  State<StartViewPage> createState() => _startViewPageViewState();
}

class _startViewPageViewState extends State<StartViewPage> {
  var _position = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: PRIMARY_COLOR,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/1.1,
            child: PageView(
              onPageChanged: (page){
                setState((){
                  _position = page.toDouble();
                });
              },
              children: [
                FirstBannerView(),
                FirstBannerView(),
                FirstBannerView(),
                FirstBannerView()
              ],
            ),
          ),
          // SizedBox(height: MARGIN_MEDIUM_2,),
          Spacer(),
          DotsIndicator(
            dotsCount: 4,
            position: _position,
            decorator: DotsDecorator(
                color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
                activeColor: SIGN_PHONE_NUMBER_BUTTON_COLOR
            ),
          )
        ],
      ),
    );
  }
}
