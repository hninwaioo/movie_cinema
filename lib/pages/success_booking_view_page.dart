import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/dimens.dart';

class SuccessBookingViewPage extends StatelessWidget {
  const SuccessBookingViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_XXLARGE),
      color: Colors.transparent,
      child: Image.asset("assets/images/success_booking.png"),
    );
  }
}
