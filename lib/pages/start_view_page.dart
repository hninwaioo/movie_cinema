import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/home_navigation_view_page.dart';
import 'package:movie_cinema/pages/login_view_page.dart';
import 'package:splashscreen/splashscreen.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../resources/colors.dart';

class StartViewPage extends StatefulWidget {

  @override
  State<StartViewPage> createState() => _startViewPageViewState();
}

class _startViewPageViewState extends State<StartViewPage> {

  MovieModel mMovieModel = MovieModelImpl();

  String? checkToken;

  @override
  void initState() {
    super.initState();

    mMovieModel.signInWithPhoneNumberFromDatabase(201)?.then((user) async{
      if(user.token != null){
        checkToken = user.token;
        print("checkToken=>${checkToken}");

      }else{

        print("checkToken=>null");

      }
    }).catchError((error){
      debugPrint(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
        color: PRIMARY_COLOR,
      child: Center(
        child: SplashScreen(
            seconds: 10,
            navigateAfterSeconds:
            (checkToken != null)
                ?
            HomeNavigationViewPage():
            LoginViewPage(),

            image: Image.asset('assets/images/main_logo.png'),
            photoSize: 200,
            useLoader: false,
            backgroundColor: PRIMARY_COLOR
        ),
      )

    );
  }
}
