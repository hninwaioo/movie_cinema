import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class MovieDetailMessageView extends StatelessWidget {
  const MovieDetailMessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_MEDIUM),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: MOVIES_MESSAGE_BACKGROUND
      ),
      child: Row(
        children: [
          MoviesReleaseMessage(),
          Spacer(),
          Image.asset("assets/images/message_bg.png")
        ],
      ),
    );
  }
}

class MoviesReleaseMessage extends StatelessWidget {
  const MoviesReleaseMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText("Releasing in 5 days", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM,),
          Text(
            "Get notify as soon as movie\nbooking opens up in your city!",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          ElevatedButton.icon(// <-- ElevatedButton
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active_rounded,
              color: Colors.black,
              size: 24.0,
            ),
            label: Text('Set Notification',
            style: TextStyle(
              color: Colors.black
            ),
            ),
              style: ElevatedButton.styleFrom(
                primary: SIGN_PHONE_NUMBER_BUTTON_COLOR,

              )
          ),
        ],
      ),
    );
  }
}

