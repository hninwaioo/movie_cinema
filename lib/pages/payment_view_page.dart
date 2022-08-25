import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/ticket_confirmation_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class PaymentViewPage extends StatelessWidget {
  const PaymentViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 24,),
        ),
        title: TypeText("Payment",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM_LARGE),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: SIGN_PHONE_NUMBER_BUTTON_COLOR
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  // icon: Icon(
                  //   Icons.access_time,
                  //   color: Colors.black,
                  //   size: 24.0,
                  // ),
                  icon: Image.asset('assets/images/unlock_offer.png'),
                  label: Text(UNLOCK_PROMOCODE,
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0,45),
                    primary: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
              child: TypeText("Choose your payment type", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X),

            ),
            PaymentTypesSectionView()
          ],
        ),
      ),
    );
  }
}

class PaymentTypesSectionView extends StatelessWidget {
  // const PaymentTypesSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentTypesView("assets/images/payment_upi_icon.png","UPI"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_gift_voucher.png","Gift Voucher"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_quick_pay.png","Quick Pay"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_credit_card.png","Credit Card/Debit Card"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_redeem_point.png","Redeem Point"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_mobile_wallet.png","Mobile Wallet"),
          SizedBox(height: MARGIN_MEDIUM_2,),
          PaymentTypesView("assets/images/payment_net_banking.png","Net Banking"),

        ],
      ),
    );
  }
}

class PaymentTypesView extends StatelessWidget {

  String _image;
  String _text;
  PaymentTypesView(this._image,this._text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _navigateToTicketConfirmScreen(context);
      },
      child: Container(
        padding: EdgeInsets.all(MARGIN_MEDIUM_2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: PRIMARY_COLOR,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.white12,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75)
            )
          ],

        ),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(_image),
                SizedBox(width: MARGIN_MEDIUM,),
                TypeText(_text, Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 24,)
          ],
        ),
      ),

    );

  }

  Future<dynamic> _navigateToTicketConfirmScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => TicketConfirmationViewPage()
    )
    );
  }
}

