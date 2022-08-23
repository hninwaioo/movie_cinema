import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../resources/dimens.dart';
import '../widgets/gradient_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child:
          BannerImageView(),
        ),
        Positioned.fill(
            child: GradientView()
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerDiscountView(),
        ),
      ],
    );
  }
}

class BannerImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network(
        "https://d1sag4ddilekf6.azureedge.net/compressed/merchants/9-CY32EB2ETB43WA/hero/1f901883836148bf8a9150277b6e7967_1658064288904088500.jpeg",
        fit:BoxFit.cover
    );
  }
}

class BannerDiscountView extends StatelessWidget {
  const BannerDiscountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("10%",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text("off",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_SMALL,
                    fontWeight: FontWeight.w500
                ),

              ),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              Text("with",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_SMALL,
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(width: MARGIN_SMALL,),
              Text("KBZ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: MARGIN_SMALL,),
              Text("debit card",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_SMALL,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          Image.asset("assets/images/debit_card.png")

        ],
      ),
    );
  }
}