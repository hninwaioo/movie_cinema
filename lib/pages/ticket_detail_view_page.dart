import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/ticket_list_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/strings.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/snack/add_snack_list_vo.dart';
import '../resources/dimens.dart';
import '../viewsitems/curve_booking_button_view.dart';
import '../widgets/type_text.dart';
import 'check_out_view_page.dart';

class TicketDetailViewPage extends StatefulWidget {

  List<AddSnackListVO>? addSnackListVO;
  TicketDetailViewPage({required this.addSnackListVO});


  @override
  State<TicketDetailViewPage> createState() => _TicketDetailViewPageState();
}

class _TicketDetailViewPageState extends State<TicketDetailViewPage> {

  @override
  void initState(){
    super.initState();
    print("CheckSnackList=>${widget.addSnackListVO}");
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
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),

          title: Center(
              child: TypeText("Ticket Details",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,)

          )
      ),
      body: SingleChildScrollView(

        child: Column(

          children: [
            SizedBox(height: MARGIN_MEDIUM_2,),

            // TicketDetailPage(
            //   SET_NOTIFICATION,TICKET_CANCEL_COLOR,
            //   mMovieVO: widget,
            // ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            CancelBookingView(),
            SizedBox(height: MARGIN_MEDIUM_2,),

          ],
        ),
      ),
    );
  }
}

class TicketDetailPage extends StatelessWidget {
  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;
  String _text;
  Color _btnColor;
  List<AddSnackListVO>? addSnackListVO;

  TicketDetailPage(this._text,this._btnColor,{
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate,
    required this.addSnackListVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1,

      child: Stack(
        children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(68, 68, 68, 1.0),
                      Color.fromRGBO(34, 34, 34, 1.0),
                      Color.fromRGBO(68, 68, 68, 1.0),
                    ]
                )
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  Row(
                    children: [
                      TypeText(mMovieVO?.originalTitle??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                      TypeText("(3D)(U/A)", Colors.white, TEXT_REGULAR_1X,isFontWeight: false,),

                    ],
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  Row(
                    children: [
                      TypeText("JCGV:Junction City", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
                      TypeText("(Screen 2)", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),
                    ],
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),

                  MoviesDateTimeLocation(
                    startTime: startTime??"",
                    completeDate: completeDate??"",
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  M_TicketView(),
                  SizedBox(height: MARGIN_MEDIUM,),
                  Row(
                    children: [
                      TypeText("Gold-G8,G7", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                      Spacer(),
                      TypeText("30000 Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                    ],
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  Divider(
                    color: PRIMARY_HINT_COLOR,
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  FoodAndBeverageViewpage(addSnackListVO),
                ],
              ),
            ),
          ),


          Positioned(
            left: 0,
            right: 0,
            top: 380,
            child: Column(
              children: [
                SizedBox(height: MARGIN_MEDIUM_2,),
                DottedAndContainerView(),
              ],
            )
            // DottedAndContainerView(),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3.5,
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM_LARGE,),

                  ConvenienceFeeView(_text,_btnColor),
                  SizedBox(height: MARGIN_MEDIUM_2,),

                  Divider(
                    color: PRIMARY_HINT_COLOR,
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  TotalChargesView(),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}

class FoodAndBeverageViewpage extends StatelessWidget {

  List<AddSnackListVO>? addSnackListVO;
  FoodAndBeverageViewpage(this.addSnackListVO);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/online_food_icon.png",color: Colors.white,
                    height: 30,width: 24,),
                    SizedBox(width: MARGIN_SMALL,),
                    TypeText("Food and Beverage", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                    SizedBox(width: MARGIN_MEDIUM,),
                    Image.asset("assets/images/down_arrow_icon.png",color: Colors.white,)
                  ]
              ),
              Spacer(),
              TypeText("3000 Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),

          Container(
    // color: SIGN_PHONE_NUMBER_BUTTON_COLOR,

            height: 200,
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              padding: EdgeInsets.only(left: MARGIN_SMALL),
              scrollDirection: Axis.vertical,
              itemCount: addSnackListVO?.length,
              // itemBuilder:
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: (addSnackListVO != null)
                        ?
                    FoodTypesView(
                      addSnackListVO?[index],
                      toRemoveFood: (){
                        print("object==>${addSnackListVO?[index].snackName}");
                        addSnackListVO?.removeWhere((item) => item.snackName == addSnackListVO?[index].snackName);
                      },
                    )
                        : CircularProgressIndicator()
                );
                },
            ),
            // Text("DAta"),
    )

          // FoodTypesView("Potato Chips(Qt.1)","1500 Ks"),
          // SizedBox(height: MARGIN_MEDIUM,),
          //
          // FoodTypesView("Cocacola Large(Qt.1)","1500 Ks"),
          // SizedBox(height: MARGIN_XLARGE,),

        ],
      )

    );
  }
}

class FoodTypesView extends StatelessWidget {

  AddSnackListVO? addSnack;
  Function toRemoveFood;
  FoodTypesView(this.addSnack,{required this.toRemoveFood});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          this.toRemoveFood();
        },

        child:  Row(
          children: [
            Row(
              children: [
                Image.asset("assets/images/food_cancel_icon.png"),
                SizedBox(width: MARGIN_MEDIUM,),
                TypeText("${addSnack?.snackName??""}", PRIMARY_HINT_COLOR, TEXT_REGULAR),
                SizedBox(width: MARGIN_MEDIUM,),
                TypeText("Qt.${addSnack?.quantity}", PRIMARY_HINT_COLOR, TEXT_REGULAR)

              ],
            ),
            Spacer(),
            TypeText("${addSnack?.totalPrice} Ks", PRIMARY_HINT_COLOR, TEXT_REGULAR)
          ],
        ),
      )
    );
  }
}

class ConvenienceFeeView extends StatelessWidget {

  String _text;
  Color _btnColor;

  ConvenienceFeeView(this._text,this._btnColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  TypeText("Convenience Fee", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                  SizedBox(width: MARGIN_MEDIUM,),
                  Image.asset("assets/images/down_arrow_icon.png",color: Colors.white,)
                ],
              ),
              Spacer(),
              TypeText("500 Ks", PRIMARY_HINT_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
            ],
          ),

          SizedBox(height: MARGIN_MEDIUM,),

          ElevatedButton.icon(// <-- ElevatedButton
              onPressed: () {
                // showDialog(context: context, builder: builder)

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30.0)), //this right here
                        child: Container(
                          height: 450,
                          child: TermsAndPolicyViewPage()
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 24.0,
              ),
              label: Text(_text,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _btnColor,
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(30)
                ),

              )
          ),
        ],
      ),
    );
  }
}

class TotalChargesView extends StatelessWidget {
  const TotalChargesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TypeText("Total", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
          Spacer(),
          TypeText("33500 Ks", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,)
        ],
      ),
    );
  }
}

class CancelBookingView extends StatelessWidget {
  const CancelBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeText("Refund Amount", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              TypeText("15000 Ks", TICKET_CANCEL_COLOR, TEXT_REGULAR_1X,isFontWeight: true,)
            ],
          ),
          Spacer(),

          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: MediaQuery.of(context).size.width/1.8,
                child: CurveBookingButtonView("Cancel Booking",Colors.white,TICKET_CANCEL_COLOR))

          )
        ],
      ),
    );
  }
}







