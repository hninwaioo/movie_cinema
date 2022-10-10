import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/movie_vo.dart';
import 'package:movie_cinema/pages/ticket_detail_view_page.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import 'package:dotted_line/dotted_line.dart';

import '../network/api_constant.dart';

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
          // MoviesAboutViewList(),
          SizedBox(height: MARGIN_MEDIUM_2,),
          // MoviesAboutViewList(),
          SizedBox(height: MARGIN_MEDIUM_2,),
          // MoviesAboutViewList(),
          SizedBox(height: MARGIN_MEDIUM_2,),

        ],
      ),
    );
  }
}

class MoviesAboutViewList extends StatelessWidget {

  MovieVO? movieVO;
  String? completeDate;
  String? startTime;
  MoviesAboutViewList({required this.movieVO,
    required this.completeDate,
    required this.startTime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // _navigateToTicketDetailScreen(context);
      },
      child: Container(

        height: MediaQuery.of(context).size.height/1.8,

        child: Stack(
          children: [

            Align(
              alignment: Alignment.topCenter,
              child:  Container(

                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
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
                child: Column(
                  children: [
                    SizedBox(height: MARGIN_MEDIUM_2,),
                    MovieAboutImageView(movieVO: movieVO,imageUrl: movieVO?.posterPath??"",),
                    SizedBox(height: MARGIN_MEDIUM_2,),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 220,
              child: DottedAndContainerView(),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                width: double.infinity,
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: Column(
                  children: [
                    SizedBox(height: MARGIN_MEDIUM_2,),
                    MoviesDateTimeLocation(
                      completeDate: completeDate??"",
                      startTime: startTime??"3:30 PM",

                    ),
                    SizedBox(height: MARGIN_MEDIUM_2,),

                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }


  // Future<dynamic> _navigateToTicketDetailScreen(BuildContext context) {
  //   return Navigator.push(context, MaterialPageRoute(
  //       builder: (context) => TicketDetailViewPage()
  //   )
  //   );
  // }
}

class DottedAndContainerView extends StatelessWidget {
  const DottedAndContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),

      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:   Container(
              margin: EdgeInsets.only(right: 16),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: PRIMARY_COLOR
              ),
            ),
          ),

          Positioned(
            // alignment: Alignment.center,
            left: 32,
            right: 32,
            child: DottedLine(dashLength: 10, dashGapLength: 10,dashColor: PRIMARY_HINT_COLOR,),

          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: PRIMARY_COLOR
              ),
            ),
          ),
        ],
      ),
    );

  }
}


class MovieAboutImageView extends StatelessWidget {

  MovieVO? movieVO;
  String imageUrl;
  MovieAboutImageView({required this.movieVO, required this.imageUrl});

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
                // "https://cps-static.rovicorp.com/2/Open/NBC_Universal/Program/44168205/_derived_jpg_q90_310x470_m0/MinionsTheRiseOfGru_2x3_6_1658296310419_7.jpg",
                "$IMAGE_BASE_URL$imageUrl",
                height: 170,
                fit:BoxFit.cover,
                width: 100,

              )
          ),
          SizedBox(width: MARGIN_MEDIUM_LARGE,),

          MoviesAboutViewsPage(movieVO: movieVO,)
        ],
      ),
    );
  }
}

class MoviesAboutViewsPage extends StatelessWidget {

  MovieVO? movieVO;
  MoviesAboutViewsPage({required this.movieVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_XLARGE,),
          Row(
            children: [
              TypeText(movieVO?.originalTitle??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
              TypeText("(3D)(U/A)", Colors.white, TEXT_REGULAR_1X,isFontWeight: false,),

            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          TypeText("JCGV:Junction City", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM_LARGE,),
          M_TicketView(),
          SizedBox(height: MARGIN_MEDIUM,),
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
  String startTime;
  String completeDate;
  MoviesDateTimeLocation({required this.startTime, required this.completeDate});

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
              TypeText(
                  // "Sat,18 Jun,2022",
                completeDate,
                  Colors.white, TEXT_REGULAR)
            ],
          ),
          // Spacer(),
          SizedBox(width: MARGIN_MEDIUM,),

          Column(
            children: [
              Icon(Icons.access_time,
                color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
              SizedBox(height: MARGIN_MEDIUM,),
              TypeText(
                  // "3:30 PM",
                startTime,
                  Colors.white, TEXT_REGULAR)
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



