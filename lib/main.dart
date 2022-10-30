import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/config_data_vo.dart';
import 'package:movie_cinema/network/responses/get_cinema_response.dart';
import 'package:movie_cinema/network/responses/user_success_token_response.dart';
import 'package:movie_cinema/pages/start_view_page.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
import 'data/vos/banner_vo.dart';
import 'data/vos/cinema/cinema_facilities_vo.dart';
import 'data/vos/cinema/cinema_vo.dart';
import 'data/vos/cinema_timeslots/cinema_data_vo.dart';
import 'data/vos/cinema_timeslots/time_slots_vo.dart';
import 'data/vos/cities_vo.dart';
import 'data/vos/movie_now_and_coming_soon/collection_vo.dart';
import 'data/vos/movie_now_and_coming_soon/date_vo.dart';
import 'data/vos/movie_now_and_coming_soon/genres_vo.dart';
import 'data/vos/movie_now_and_coming_soon/movie_vo.dart';
import 'data/vos/movie_now_and_coming_soon/production_companies_vo.dart';
import 'data/vos/movie_now_and_coming_soon/production_countries_vo.dart';
import 'data/vos/movie_now_and_coming_soon/spoken_languages_vo.dart';
import 'data/vos/payment_vo.dart';
import 'data/vos/snack/snack_categories_vo.dart';
import 'data/vos/snack/snack_vo.dart';
import 'data/vos/user_data_vo.dart';
import 'network/responses/get_cinema_timeslots_response.dart';
import 'network/responses/get_config_response.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataVOAdapter());
  Hive.registerAdapter(GetUserSuccessTokenResponseAdapter());
  Hive.registerAdapter(CityVOAdapter());
  Hive.registerAdapter(BannerVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenresVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());

  Hive.registerAdapter(SpokenLanguagesVOAdapter());
  Hive.registerAdapter(SnackCategoryVOAdapter());
  Hive.registerAdapter(SnackVOAdapter());
  Hive.registerAdapter(PaymentVOAdapter());

  Hive.registerAdapter(ConfigDataVOAdapter());
  Hive.registerAdapter(ConfigResponseAdapter());

  Hive.registerAdapter(CinemaVOAdapter());
  Hive.registerAdapter(CinemaFacilitiesVOAdapter());
  Hive.registerAdapter(CinemaResponseAdapter());

  Hive.registerAdapter(CinemaDataVOAdapter());
  Hive.registerAdapter(TimeslotsVOAdapter());
  Hive.registerAdapter(CinemaTimeslotsResponseAdapter());

  await Hive.openBox<GetUserSuccessTokenResponse>(BOX_NAME_USER_DATA_TOKEN_VO);
  await Hive.openBox<CitiesVO>(BOX_NAME_CITY_VO);
  await Hive.openBox<BannerVO>(BOX_NAME_BANNER_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);

  await Hive.openBox<SnackCategoriesVO>(BOX_NAME_SNACK_CATEGORY_VO);
  await Hive.openBox<SnackVO>(BOX_NAME_SNACK_VO);
  await Hive.openBox<SnackVO>(BOX_NAME_CATEGORIES_SNACK_VO);
  await Hive.openBox<PaymentVO>(BOX_NAME_PAYMENT_VO);

  await Hive.openBox<ConfigDataVO>(BOX_NAME_CONFIG_DATA_VO);
  await Hive.openBox<CinemaVO>(BOX_NAME_CINEMA_VO);
  await Hive.openBox<CinemaDataVO>(BOX_NAME_CINEMA_DATA_VO);

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity

      ),

        // initialRoute: '/login',
        // routes: {
        //   // When navigating to the "/" route, build the FirstScreen widget.
        //   '/login': (context) => LoginViewPage(),
        //   // When navigating to the "/second" route, build the SecondScreen widget.
        //   // '/second': (context) => HomeNavigationViewPage(),
        // },
      home: StartViewPage()
      // ChooseLocationViewPage(),
      // routes: <String, WidgetBuilder>{
      //   '/login': (BuildContext context) => LoginViewPage(),
      // },


      // PinCodeVerificationScreen(phoneNumber:
      // "+959259102403"),
    );
  }

}

// 15022|oOxP98SVNbTuwxycCwTaAtc76GTTGsyFjbrkpzxV

//physics : NeverScrollableScrollPhysics
//neverscrollablescrollphysics in flutter
//maxChildExtent : in flutter


