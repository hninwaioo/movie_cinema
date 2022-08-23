import 'package:flutter/material.dart';
import '../resources/colors.dart';

class GradientForMoviesView extends StatelessWidget {
  const GradientForMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                PRIMARY_HINT_COLOR,

              ]
          )
      ),
    );
  }
}
