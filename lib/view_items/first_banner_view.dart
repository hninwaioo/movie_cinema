import 'package:flutter/material.dart';

import '../resources/colors.dart';

class FirstBannerView extends StatelessWidget {
  const FirstBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset('assets/images/main_logo.png'),
      ),
    );
  }
}
