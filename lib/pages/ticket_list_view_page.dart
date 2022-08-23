import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/ticket_detail_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import 'package:dotted_line/dotted_line.dart';

class TicketListViewPage extends StatelessWidget {
  const TicketListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        title: Center(
          child: TypeText("Your Ticket",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,)

        )
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: MARGIN_SMALL),
        children: [
          MoviesAboutViewList(),
          SizedBox(width: MARGIN_MEDIUM,),
          MoviesAboutViewList(),
          SizedBox(width: MARGIN_MEDIUM,),
          MoviesAboutViewList(),
          SizedBox(width: MARGIN_MEDIUM,),

        ],
      ),
    );
  }
}

class MoviesAboutViewList extends StatelessWidget {
  const MoviesAboutViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _navigateToTicketDetailScreen(context);
      },
      child: Container(

        height: MediaQuery.of(context).size.height/1.8,
        padding: EdgeInsets.all(MARGIN_MEDIUM),
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent,
                  Colors.white10,
                  Colors.transparent
                ]
            )
        ),

        child: Column(
          children: [
            MovieAboutImageView(),
            SizedBox(height: MARGIN_MEDIUM,),
            DottedLine(dashLength: 10, dashGapLength: 10,dashColor: PRIMARY_HINT_COLOR),
            SizedBox(height: MARGIN_MEDIUM,),
            MoviesDateTimeLocation()
          ],
        ),
      )
    );

  }


  Future<dynamic> _navigateToTicketDetailScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => TicketDetailViewPage()
    )
    );
  }
}

class MovieAboutImageView extends StatelessWidget {
  const MovieAboutImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child:
              Image.network(
                "https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",
                height: 180,
                fit:BoxFit.cover,
                width: 120,

              )
          ),
          SizedBox(width: MARGIN_MEDIUM_LARGE,),

          MoviesAboutViewsPage()
        ],
      ),
    );
  }
}

class MoviesAboutViewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              TypeText("Minions", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              TypeText("(3D)(U/A)", Colors.white, TEXT_REGULAR_1X,isFontWeight: false,),

            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          TypeText("JCGV:Junction City", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          M_TicketView(),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          Row(
            children: [
              TypeText("Gold-G8,G7", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              TypeText("(Screen 2)", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),

            ],
          )

        ],
      ),
    );
  }
}

class M_TicketView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TypeText("M-Ticket(", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),
        TypeText("2", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR,isFontWeight: true,),
        TypeText(")", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),

      ],
    );
  }
}

class MoviesDateTimeLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.calendar_month_outlined,
                color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
              SizedBox(height: MARGIN_MEDIUM,),
              TypeText("Sat,18 Jun,2022", Colors.white, TEXT_REGULAR)
            ],
          ),
          // Spacer(),
          SizedBox(width: MARGIN_MEDIUM,),

          Column(
            children: [
              Icon(Icons.access_time,
                color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
              SizedBox(height: MARGIN_MEDIUM,),
              TypeText("3:30 PM", Colors.white, TEXT_REGULAR)

            ],
          ),

          // Spacer(),
          SizedBox(width: MARGIN_MEDIUM,),
          Column(
            children: [
              Icon(Icons.location_on,
                color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
              SizedBox(height: MARGIN_MEDIUM,),
              TypeText("Q583+JPP,Corner\nof, Bogyoke Lann,\nYangon", Colors.white, TEXT_REGULAR)

            ],
          ),
        ],
      ),
      
    );
  }
}



