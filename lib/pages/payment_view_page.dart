import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_data_vo.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_snacks_vo.dart';
import 'package:movie_cinema/network/responses/get_checkout_response.dart';
import 'package:movie_cinema/pages/ticket_confirmation_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../data/function/show_load_dialog.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/payment_vo.dart';
import '../data/vos/snack/add_snack_list_vo.dart';

class PaymentViewPage extends StatefulWidget {
  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;
  List<AddSnackListVO>? addSnackListVO;

  PaymentViewPage({
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate,
    required this.addSnackListVO});

  @override
  State<PaymentViewPage> createState() => _PaymentViewPageState();
}

class _PaymentViewPageState extends State<PaymentViewPage> {
  MovieModel mMovieModel = MovieModelImpl();
  String token = "Bearer 14677|TBdKG0ByjbrAmkHX3317oN1aMljYh1nZK1Ug5M86";

  List<PaymentVO>? paymentList;
  CheckOutResponse? checkOutResponse;

  @override
  void initState(){
    super.initState();

    mMovieModel.getPaymentType(token)
    .then((payment){
      setState((){
        this.paymentList = payment;
      });
    }).catchError((error){
      debugPrint("ERROR=>${error.toString()}");
    });
  }

  void _CheckOutPayment(String token, PostCheckOutDataVO postCheckOutDataVO){

    mMovieModel.CheckOutPayment(token, postCheckOutDataVO)
        ?.then((checkout){
          setState((){
            print("objectCode=>${checkout.code}");
            if(checkout.code == 200){
              Navigator.pop(context);
              _navigateToTicketConfirmScreen(
                  context,
                widget.mMovieVO,
                widget.cinemaDayTimeSlots??0,
                widget.startTime??"",
                widget.completeDate??"",
                checkout.checkoutDataVO?.qrCode??"",
              );
            }else if(checkout.code == 400){
              Navigator.pop(context);
              print("Code=>${400}");
            }
            checkOutResponse = checkout;
            print("SUCCESS");
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
                  labelStyle: TextStyle(
                      color: SIGN_PHONE_NUMBER_BUTTON_COLOR
                  ),
                  hintText: 'Enter a Your Name',
                  hintStyle: TextStyle(
                    color: PRIMARY_HINT_COLOR
                  ),
                  // border: OutlineInputBorder(
                    // borderSide: BorderSide(
                    //   color: SIGN_PHONE_NUMBER_BUTTON_COLOR
                    // ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: SIGN_PHONE_NUMBER_BUTTON_COLOR, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: PRIMARY_HINT_COLOR, width: 2.0),
                    ),
                  // ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
              child: ElevatedButton.icon(
                  onPressed: () {},

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

            (paymentList!=null)
            ?
            PaymentTypesSectionView(
              paymentList: paymentList??[],
              checkOutPayment: (paymentId){

                PostCheckOutSnacksVO postCheckOutSnacksVo = PostCheckOutSnacksVO(
                  id: 1, quantity: 2
                );

                List<PostCheckOutSnacksVO> checkoutSnackList = [];
                checkoutSnackList.add(postCheckOutSnacksVo);
                print("SnackList=>${checkoutSnackList}");

                PostCheckOutDataVO postCheckOutDataVO = PostCheckOutDataVO(
                    cinemaDayTimeslotId: widget.cinemaDayTimeSlots,
                    seatNumber: "G-8",
                    bookingDate: widget.completeDate,
                    movieId: widget.mMovieVO?.id,
                    paymentTypeId: 1,
                    postCheckOutSnacksVO: widget.addSnackListVO
                );

                showLoginDialog(context);
                _CheckOutPayment(token,postCheckOutDataVO);

              },
            )
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class PaymentTypesSectionView extends StatelessWidget {

  List<PaymentVO> paymentList;
  Function (int?) checkOutPayment;
  PaymentTypesSectionView({required this.paymentList, required this.checkOutPayment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_LARGE),
      child:

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     // PaymentTypesView("assets/images/payment_upi_icon.png","UPI"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_gift_voucher.png","Gift Voucher"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_quick_pay.png","Quick Pay"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_credit_card.png","Credit Card/Debit Card"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_redeem_point.png","Redeem Point"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_mobile_wallet.png","Mobile Wallet"),
      //     // SizedBox(height: MARGIN_MEDIUM_2,),
      //     // PaymentTypesView("assets/images/payment_net_banking.png","Net Banking"),
      //
      //   ],
      // ),

      Container(
        height: MediaQuery.of(context).size.height/2,
        child:
        ListView.builder(
          padding: EdgeInsets.only(left: MARGIN_SMALL),
          scrollDirection: Axis.vertical,
          itemCount: paymentList.length,
          // itemBuilder:
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                    child: (paymentList != null)
                        ?
                    PaymentTypesView(
                        paymentVO: paymentList[index],
                        checkOutPayment: (index) {
                          checkOutPayment(paymentList[index].id);
                          print("objectToTicket2");

                        }
                    )

                : CircularProgressIndicator()
            // SnackItemsView(snackList?[index]),
                ),
                SizedBox(height: MARGIN_MEDIUM_2,),
              ],
            );
          },
        ),
      )
    );
  }
}

class PaymentTypesView extends StatelessWidget {

  PaymentVO? paymentVO;
  Function (int) checkOutPayment;
  PaymentTypesView({required this.paymentVO, required this.checkOutPayment});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // _navigateToTicketConfirmScreen(context);
        checkOutPayment(paymentVO?.id??0);
        print("objectToTicket");
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
                Image.network(paymentVO?.icon??""),
                SizedBox(width: MARGIN_MEDIUM,),
                TypeText(paymentVO?.title??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)
          ],
        ),
      ),

    );

  }

}

Future<dynamic> _navigateToTicketConfirmScreen(
    BuildContext context,
    MovieVO? mMovieVO,
    int cinemaDayTimeSlots,
    String startTime,
    String completeDate,
    String scanImage
    ) {
  return Navigator.push(context, MaterialPageRoute(
      builder: (context) => TicketConfirmationViewPage(
        mMovieVO: mMovieVO,
        cinemaDayTimeSlots: cinemaDayTimeSlots,
        startTime: startTime,
        completeDate: completeDate,
        scanImage: scanImage,
      )
  )
  );
}

