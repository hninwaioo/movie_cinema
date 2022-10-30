import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../data/vos/banner_vo.dart';
import '../network/api_constant.dart';
import '../resources/dimens.dart';
import '../widgets/gradient_view.dart';

class BannerView extends StatelessWidget {

  BannerVO? bannerVO;
  BannerView({required this.bannerVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),

      child: Stack(
        children: [
          Positioned.fill(
            child:
            BannerImageView(
              mImageUrl: bannerVO?.url,
            ),
          ),
          Positioned.fill(
              child: GradientView()
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerDiscountView(),
          ),
        ],
      ),
    );

  }
}

class BannerImageView extends StatelessWidget {

  String? mImageUrl;
  BannerImageView({required this.mImageUrl});
  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          child:  Image.network(
          // "https://d1sag4ddilekf6.azureedge.net/compressed/merchants/9-CY32EB2ETB43WA/hero/1f901883836148bf8a9150277b6e7967_1658064288904088500.jpeg",
            mImageUrl??"",
            fit:BoxFit.cover,
      )
     
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