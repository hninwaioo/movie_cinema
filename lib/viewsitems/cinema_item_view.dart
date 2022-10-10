import 'package:flutter/material.dart';
import 'package:movie_cinema/network/responses/get_cinema_response.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../data/vos/cinema/cinema_facilities_vo.dart';
import '../data/vos/cinema/cinema_vo.dart';
import '../data/vos/cinema_timesolts/cinema_data_vo.dart';
import '../data/vos/cinema_timesolts/time_solts_vo.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../pages/buying_ticket_for_seat.dart';
import '../pages/cinema_seedetails_view_page.dart';
import '../pages/snack_food_types_view_page.dart';

class CinemaNameDetailView extends StatefulWidget {

  CinemaVO? cinemaData;
  List<TimesoltsVO>? cinemaTimeSlots;
  MovieVO? mMovieVO;
  String? completeDate;

  CinemaNameDetailView({
    required this.cinemaData,
    required this.cinemaTimeSlots,
    required this.mMovieVO,
    required this.completeDate
  });

  @override
  State<CinemaNameDetailView> createState() => _CinemaNameDetailViewState();
}

class _CinemaNameDetailViewState extends State<CinemaNameDetailView> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: GestureDetector(
        onTap: (){
          // _navigateToSnackFoodScreen(context);
          showToast;
          print("SnackTap");
        },
        child: Column(
          children: [
            Row(
              children: [
                TypeText(widget.cinemaData?.name??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                Spacer(),

                GestureDetector(
                  onTap: (){
                    _navigateToSeeDetailScreen(context, widget.cinemaData!);
                  },
                  child: Text(
                    "See Details",
                    style: TextStyle(
                        color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Container(

              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // padding: EdgeInsets.only(left: MARGIN_MEDIUM),
                  itemCount: widget.cinemaData?.facilitiesList?.length,
                  itemBuilder:(BuildContext context, int index){
                    return
                      CinemaPlaceTypesView(
                      cinemaFacilitiesVO: widget.cinemaData?.facilitiesList?[index],
                      onTapAvailable: (cinemaId){
                        showToast();
                      },
                    );
                  }
              )
            ),
            // SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Visibility(
                visible: _isVisible,
                child: (widget.cinemaTimeSlots != null)
                ?
                CinemaSeatAvailableView(cinemaTimeSlotsList: widget.cinemaTimeSlots??[],
                  mMovieVO: widget.mMovieVO,
                  completeDate: widget.completeDate,
                )
                    :
                    CircularProgressIndicator()
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
            Divider(
              color: PRIMARY_HINT_COLOR,
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

          ],
        ),
      )
    );
  }

  Future<dynamic> _navigateToSeeDetailScreen(BuildContext context,CinemaVO cinemaVO) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => CinemaSeeDetailsViewPage(cinemaVO)
    )
    );
  }
}

class CinemaPlaceTypesView extends StatelessWidget {

  CinemaFacilitiesVO? cinemaFacilitiesVO;
  Function (int) onTapAvailable;
  CinemaPlaceTypesView({required this.cinemaFacilitiesVO,required this.onTapAvailable});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapAvailable(1);
      },
        child: Container(
          child: Wrap(
            children: [
              Image.network(cinemaFacilitiesVO?.img??""),
              SizedBox(width: MARGIN_SMALL,),
              TypeText(cinemaFacilitiesVO?.title??"", PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,),
              SizedBox(width: MARGIN_MEDIUM_2,),
            ],
          ),
        )
    );
  }
}

class CinemaSeatAvailableView extends StatelessWidget {
  List<TimesoltsVO> cinemaTimeSlotsList;
  MovieVO? mMovieVO;
  String? completeDate;

  CinemaSeatAvailableView({
    required this.cinemaTimeSlotsList,
    required this.mMovieVO,
    required this.completeDate});

  // List<>
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MARGIN_MEDIUM_LARGE,),

        Container(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 3 ,
            shrinkWrap: true,
            crossAxisSpacing: MARGIN_MEDIUM,
            mainAxisSpacing: MARGIN_MEDIUM,
            children: List.generate(
                cinemaTimeSlotsList.length,
                    (index){
              return Container(
                child: CinemaSeatAvailable(
                  timesoltsData: cinemaTimeSlotsList[index],
                  onBuySeat: (){
                    _navigateToBuyTicketSeatScreen(
                      context,
                       mMovieVO,
                      cinemaTimeSlotsList[index].cinemaDayTimeslotId??0,
                       cinemaTimeSlotsList[index].startTime??"",
                       completeDate??""
                    );
                  },
                  status: cinemaTimeSlotsList[index].status??0,
                  mMovieVO: mMovieVO,
                ),
              );
            }),
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2,),

        Row(
          children: [
            Icon(Icons.info_rounded,color: PRIMARY_HINT_COLOR,),
            SizedBox(width: MARGIN_MEDIUM,),
            TypeText(LONG_PRESS_ACTION, PRIMARY_HINT_COLOR, TEXT_REGULAR_SMALL,isFontWeight: true,)
          ],
        ),
      ],
    );

  }
}

class CinemaSeatAvailable extends StatefulWidget {

  TimesoltsVO? timesoltsData;
  int status;
  Function onBuySeat;
  MovieVO? mMovieVO;

  CinemaSeatAvailable({
    required this.timesoltsData,
    required this.onBuySeat,
    required this.status,
    required this.mMovieVO
  });

  @override
  State<CinemaSeatAvailable> createState() => _CinemaSeatAvailableState();
}

class _CinemaSeatAvailableState extends State<CinemaSeatAvailable> {

  String? availableMovieType;
  int? _color;

  @override
  void initState(){
    super.initState();

    print("Status==>${widget.status}");

    if(widget.status == 3){
      availableMovieType = "Almost Full";
      _color = 0xFFFF00B8 ; //puple

    }else if(widget.timesoltsData?.status == 2){
      availableMovieType = "Filling Fast";
      _color = 0xFFff7a00; // yellow
    }else {
      availableMovieType = "2 Available";
      _color = 0xFF00ffa3; // spring green
    }

  }


  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){
        widget.onBuySeat();
      },
      child: Container(
        padding: EdgeInsets.all(MARGIN_SMALL),
        margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(25, 0, 18, 1.0),
            borderRadius: BorderRadius.circular(
                5.0
            ),
            border: Border.all(width: 1,color: Color(_color??0))
        ),

        child: TypeText("${widget.timesoltsData?.startTime}\n3D\nScreen 1\n${availableMovieType}",Colors.white,TEXT_REGULAR,isFontWeight: true,),
      )
    );
  }
}

Future<dynamic> _navigateToBuyTicketSeatScreen(
    BuildContext context,
    MovieVO? mMovieVO,
    int cinemaDayTimeSlots,
    String startTime,
    String completeDate) {

  return Navigator.push(context, MaterialPageRoute(
      builder: (context) => BuyingTicketForSeatViewPage(
        mMovieVO: mMovieVO,
        cinemaDayTimeSlots: cinemaDayTimeSlots,
        startTime: startTime,
        completeDate: completeDate,
      )
  )
  );
}



