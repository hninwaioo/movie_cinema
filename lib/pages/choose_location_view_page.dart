import 'package:flutter/material.dart';
import 'package:movie_cinema/network/responses/get_set_city_response.dart';
import 'package:movie_cinema/persistence/daos/city_dao.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/widgets/type_text.dart';
import '../data/function/show_load_dialog.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/cities_vo.dart';
import '../resources/dimens.dart';
import 'home_navigation_view_page.dart';

class ChooseLocationViewPage extends StatefulWidget {

  @override
  State<ChooseLocationViewPage> createState() => _ChooseLocationViewPageState();
}

class _ChooseLocationViewPageState extends State<ChooseLocationViewPage> {

  MovieModel mMovieModel = MovieModelImpl();
  List<CitiesVO>? mCitiesList;

  get prefixIcon => null;

  @override
  void initState() {
    super.initState();

    /// Cities List
    // mMovieModel.getCities().then((citiesList) {
    //   setState(() {
    //     mCitiesList = citiesList;
    //     print("mCitiesList==>${mCitiesList}");
    //   });
    // }).catchError((error) {
    //   debugPrint("ERROR=>>${error.toString()}");
    // });

    /// Cities List DataBase
    mMovieModel.getCitiesFromDatabase().listen((citiesList){
      setState((){
        mCitiesList = citiesList;
      });
    }).onError((error){
      debugPrint("ERROR=>${error.toString()}");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/pick_region.png',
                height: 100,
              ),
            ),

            SearchLocationSectionView(prefixIcon: prefixIcon),
            GestureDetector(
              onTap: (){
            print("object=>${mCitiesList}");

            },
              child: Container(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/images/cities_icon.png"),

              ),
            ),

            CitiesListSectionView(
                mCitiesList: mCitiesList,
            )
          ],
        ),
      ),
    );
  }
}

class SearchLocationSectionView extends StatelessWidget {
  const SearchLocationSectionView({
    Key? key,
    required this.prefixIcon,
  }) : super(key: key);

  final  prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_MEDIUM_2),

      child: Row(
        children: [
          Expanded(
              child:
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(22, 22, 22, 1.0),
                          Color.fromRGBO(21, 21, 21, 1.0)
                        ]
                    )
                ),
                child:  TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: prefixIcon??Icon(Icons.search_outlined,color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
                    hintText: "Search your location",
                    hintStyle: TextStyle(
                        color: PRIMARY_HINT_COLOR
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),
              // Spacer(),
          GestureDetector(
              onTap: (){
                _navigateToHomeNavigationScreen(context);
                print("movieItemTap");
              },
            child: Container(
                margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                height: 45,width: 45,
                decoration: BoxDecoration(
                    color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                    borderRadius: BorderRadius.circular(
                        MARGIN_MEDIUM
                    )
                ),
                child: Image.asset("assets/images/location_arrow.png")
              // Icon("assets/images/location_arrow.png"),
            )
          )
        ],
      ),
    );
  }
}

Future<dynamic> _navigateToHomeNavigationScreen(BuildContext context) {

  return Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomeNavigationViewPage()
  )
  );
}

class CitiesListSectionView extends StatefulWidget {
  List<CitiesVO>? mCitiesList;
  CitiesListSectionView({required this.mCitiesList});

  @override
  State<CitiesListSectionView> createState() => _CitiesListSectionViewState();
}

class _CitiesListSectionViewState extends State<CitiesListSectionView> {

  MovieModel mMovieModel = MovieModelImpl();

  SetCityResponse? setCityResponse;

  String? checkToken;

  CityDao mCityDao = CityDao();

  @override
  void initState(){
    super.initState();

    mMovieModel.signInWithPhoneNumberFromDatabase(201)?.then((user) {
      if(user.token != null){
        checkToken = user.token;
      }

    }).catchError((error){
      debugPrint(error.toString());
    });

  }

  void _setCity(int cityId){

    print("objectUserToken=>${checkToken}");

    mMovieModel.setCity("Bearer ${checkToken}", cityId)?.then((city) {
      setState((){
        setCityResponse = city;
        if(city.code == 200){
          Navigator.pop(context);

          _navigateToHomeNavigationScreen(context);

        }else{
          Navigator.pop(context);
        }
      });

    }).catchError((error){
      Navigator.pop(context);
      debugPrint("ERROR=>>${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Container(
         alignment: Alignment.topLeft,
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         width: double.infinity,
         color: PRIMARY_HINT_COLOR,
         child: TypeText(
           "Cities",
           Colors.white,
           TEXT_REGULAR_1X,
           isFontWeight: true,
         ),
       ),

       // CitiyItemView(),
       Container(
           height: MOVIE_LIST_ITEM_WIDTH,
           child: (widget.mCitiesList != null)
               ?
           ListView.builder(
               scrollDirection: Axis.vertical,
               padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
               itemCount: widget.mCitiesList?.length,
               itemBuilder:(BuildContext context, int index){
                 return Row(
                   children: [
                     CitiyItemView(
                         mCitiy: widget.mCitiesList?[index],
                         onChooseCity: (cityId){
                           print("CityId=>${cityId}");
                           showLoginDialog(context);
                           _setCity(widget.mCitiesList?[index].id??0);
                           mCityDao.savedCityName(widget.mCitiesList?[index]);

                         }),

                     Divider(
                       color: PRIMARY_HINT_COLOR,
                     ),
                   ],
                 );
               }
           )
               :
           Center(
             child: CircularProgressIndicator(),
           )
       ),

       // Divider(
       //   color: PRIMARY_HINT_COLOR,
       // ),
       // Container(
       //   padding: EdgeInsets.all(MARGIN_MEDIUM_2),
       //   child: TypeText(
       //     "Mandalay",
       //     Colors.white,
       //     TEXT_REGULAR,
       //     isFontWeight: true,
       //   ),
       // ),
       // Divider(
       //   color: PRIMARY_HINT_COLOR,
       // ),
       // Container(
       //   padding: EdgeInsets.all(MARGIN_MEDIUM_2),
       //   child: TypeText(
       //     "Naypyidaw",
       //     Colors.white,
       //     TEXT_REGULAR,
       //     isFontWeight: true,
       //   ),
       // ),
       // Divider(
       //   color: PRIMARY_HINT_COLOR,
       // ),
       // Container(
       //   padding: EdgeInsets.all(MARGIN_MEDIUM_2),
       //   child: TypeText(
       //     "Bago",
       //     Colors.white,
       //     TEXT_REGULAR,
       //     isFontWeight: true,
       //   ),
       // ),
       // Divider(
       //   color: PRIMARY_HINT_COLOR,
       // ),
       // Container(
       //   padding: EdgeInsets.all(MARGIN_MEDIUM_2),
       //   child: TypeText(
       //     "Mawlamyine",
       //     Colors.white,
       //     TEXT_REGULAR,
       //     isFontWeight: true,
       //   ),
       // ),
       // Divider(
       //   color: PRIMARY_HINT_COLOR,
       // ),
     ],
    );
  }
}

class CitiyItemView extends StatelessWidget {
  CitiesVO? mCitiy;
  final Function (int) onChooseCity;
  CitiyItemView({required this.mCitiy, required this.onChooseCity});

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){
        onChooseCity(mCitiy?.id??0);
        print("object");
        },

      child: Container(
        padding: EdgeInsets.all(MARGIN_MEDIUM_2),
        child: TypeText(
          mCitiy?.name??"",
          Colors.white,
          TEXT_REGULAR,
          isFontWeight: true,
        ),
      ),
    );
  }
}
