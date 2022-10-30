import 'package:flutter/material.dart';
import 'package:movie_cinema/network/responses/get_cinema_timeslots_response.dart';
import 'package:movie_cinema/resources/dimens.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/cinema/cinema_vo.dart';
import '../data/vos/cinema_timeslots/cinema_data_vo.dart';
import '../data/vos/cinema_timeslots/config_data_vo.dart';
import '../data/vos/cinema_timeslots/config_value_list_vo.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/seven_days_date_vo.dart';
import '../resources/colors.dart';
import '../view_items/booking_movies_date_item_view.dart';
import '../view_items/booking_movies_types_item_view.dart';
import '../view_items/cinema_item_view.dart';
import 'home_navigation_view_page.dart';
import 'package:intl/intl.dart';

class BookingMoviesViewPage extends StatefulWidget {

  List<ConfigDataVO>? configDataList;
  List<ConfigValueListVO>? configValueList;
  List<CinemaVO>? cinemaList;

  MovieVO? mMovieVO;

  BookingMoviesViewPage({required this.configDataList,required this.configValueList, required this.cinemaList, required this.mMovieVO});

  @override
  State<BookingMoviesViewPage> createState() => _BookingMoviesViewPageState();
}

class _BookingMoviesViewPageState extends State<BookingMoviesViewPage> {
  MovieModel mMovieModel = MovieModelImpl();
  CinemaTimeslotsResponse? _cinemaTimeslotsResponse;
  List<CinemaDataVO>? cinemaTimeSlotsList;
  List<CinemaVO>? cinemaList;

  final _currentDate = DateTime.now();
  final _completeDate = DateFormat("yyyy-MM-dd");
  final _dayName = DateFormat('EE');
  final _dayFormatter = DateFormat('dd');
  final _monthFormatter = DateFormat('MMM');
  final dates = <Widget>[];

  String? firstSelectedDate;
  String? completeDate;
  String? day;
  String? month;
  String? dayDate;
  bool? selectedDate;
  SevenDaysDateVO? sevenDaysDateVO;
  List<SevenDaysDateVO> datesList = [];

  var cinemaId;
  Color? _color;

  String? checkToken;

  @override
  void initState(){
    super.initState();

    mMovieModel.signInWithPhoneNumberFromDatabase(201)?.then((user) {
      if(user.token != null){
        checkToken = user.token;
        print("objectCheckToken==${checkToken}");

        mMovieModel.getCinemaTimeslot("Bearer ${checkToken}", firstSelectedDate??"")
            .then((cinemaTimeslot){
          setState((){
            // this._cinemaTimeslotsResponse = cinemaTimeslot;
            this.cinemaTimeSlotsList = cinemaTimeslot;
            cinemaId = cinemaTimeSlotsList?.map((e) => e.cinemaId);

          });
        }).catchError((error) {
          debugPrint("ERROR=>${error.toString()}");
        });
      }
    }).catchError((error){
      debugPrint(error.toString());
    });

    cinemaList = widget.cinemaList;

    var cinema_id = cinemaList?.map((e) => e.id);

    firstSelectedDate = _completeDate.format(_currentDate);

    for (int i = 0; i < 14; i++) {
      final date = _currentDate.add(Duration(days: i));
      // dates.add(Column(
      //   children: [
      //     Text(_dayFormatter.format(date)),
      //     Text(_monthFormatter.format(date)),
      //   ],
      // ));

      completeDate = _completeDate.format(date);
      print("COMPLETEDATE=>${completeDate}");

      if(i == 0){
        day = "Today";
        selectedDate = true;

      }else if(i == 1){
        day = "Tomorrow";
        selectedDate = false;

      }else{
        day = _dayName.format(date);
        selectedDate = false;
      }

      dayDate = _dayFormatter.format(date);
      month = _monthFormatter.format(date);
      sevenDaysDateVO = SevenDaysDateVO(completeDate: completeDate,day: day,dayDate: dayDate,month: month,selectedDate: selectedDate??false);
      datesList.add(sevenDaysDateVO!);
      print("selected_Date=>${selectedDate}");
    }

    // mMovieModel.getCinemaTimeslot("Bearer ${checkToken}", firstSelectedDate??"")
    //     .then((cinemaTimeslot){
    //   setState((){
    //     // this._cinemaTimeslotsResponse = cinemaTimeslot;
    //     this.cinemaTimeSlotsList = cinemaTimeslot;
    //     cinemaId = cinemaTimeSlotsList?.map((e) => e.cinemaId);
    //
    //   });
    // }).catchError((error) {
    //   debugPrint("ERROR=>${error.toString()}");
    // });
  }

  void onTapSelectedDate(String dateSelected){

    mMovieModel.getCinemaTimeslot("Bearer ${checkToken}", dateSelected)
        .then((cinemaTimeslot){
      setState((){
        this.cinemaTimeSlotsList = cinemaTimeslot;
        cinemaId = cinemaTimeSlotsList?.map((e) => e.cinemaId);
        selectedDate = true;

      });
    }).catchError((error) {
      debugPrint("ERROR=>${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        title: Container(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          BookingAppBarView()
        ],
      ),
      // ignore: unnecessary_null_comparison
      body: (cinemaTimeSlotsList != null)
      ?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            BookingMoviesDateItemView(
              selectedColor: selectedDate??false,
              sevenDaysDateList: datesList,
              selectedDateTime: (completeDate){
                  onTapSelectedDate(completeDate);
                  print("SelectedDate=>${selectedDate}");

                  // setState((){
                  //   if(selectedDate == true){
                  //     _color = SIGN_PHONE_NUMBER_BUTTON_COLOR;
                  //   }else{
                  //     _color = Colors.white;
                  //   }
                  // }

              },
            ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),
            BookingMoviesTypesItemView(),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            AvailableMoviesView(widget.configValueList),

            Container(
              height: MediaQuery.of(context).size.height/2,
              margin: EdgeInsets.only(top: 16),
              child: (cinemaTimeSlotsList!=null)
                ?
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  itemCount: cinemaList?.length,
                  itemBuilder:(BuildContext context, int index){
                    return Wrap(
                      children: [
                          CinemaNameDetailView(
                          cinemaData: cinemaList?[index],
                          cinemaTimeSlots: cinemaTimeSlotsList?[index].timeslots,
                          mMovieVO: widget.mMovieVO,
                          completeDate: completeDate,
                        )
                      ],
                    );
                  }
              ):
                  Center(
                    child: CircularProgressIndicator(),
                  )
            )
          ],
        ),
      )
          :
          CircularProgressIndicator()
    );
  }
}

class BookingAppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          LocationAppBarSectionView(),
          SizedBox(width: MARGIN_MEDIUM,),
          Icon(Icons.search_outlined,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM,),
          Icon(Icons.filter_list_alt,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM,),
        ],
      ),
    );
  }
}

class AvailableMoviesView extends StatelessWidget {
  List<ConfigValueListVO>? configValueListVO;
  AvailableMoviesView(this.configValueListVO);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XLARGE,
      width: double.infinity,
      color: AVAILABLE_MOVIES_BACKGROUND_COLOR,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: configValueListVO?.length,
          shrinkWrap: true,
          itemBuilder:(BuildContext context, int index){
            return
              // AvailableMoviesItems(configValueListVO?[index]);

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AvailableMoviesItems(configValueListVO?[index]),
                  SizedBox(width: MARGIN_MEDIUM_2,)
              ],
            );
          }
      )
    );
  }
}
class AvailableMoviesItems extends StatefulWidget {
  ConfigValueListVO? configValueListVO;

  AvailableMoviesItems(this.configValueListVO);

  @override
  State<AvailableMoviesItems> createState() => _AvailableMoviesItemsState();
}

class _AvailableMoviesItemsState extends State<AvailableMoviesItems> {
  late int _color;
  late String _text;
  @override
  void initState(){
    super.initState();
    if(widget.configValueListVO?.color == "#00FFA3"){
      _color = 0xff00ffa3;
    }else if(widget.configValueListVO?.color == "#FF7A00"){
      _color = 0xffff7a00;
    }else{
      _color = 0xffFF00B8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/ellipse.png",color: Color(_color),width: 6,height: 6,
          fit: BoxFit.cover,),
          SizedBox(width: MARGIN_SMALL,),
          Text(
            widget.configValueListVO?.title??"",
            style: TextStyle(
              color: Color(_color),
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR
            ),
          )
        ],
      ),
    );
  }
}








