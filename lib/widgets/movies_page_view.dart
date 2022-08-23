import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/movies_detail_page.dart';
import 'package:movie_cinema/viewsitems/coming_soon_movies_view.dart';
import 'package:movie_cinema/viewsitems/now_showing_movies_view.dart';
import '../pages/home_navidation_view_page.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewsitems/banner_view.dart';

class MoviesPageView extends StatefulWidget {
  const MoviesPageView({Key? key}) : super(key: key);

  @override
  State<MoviesPageView> createState() => _MoviesPageViewState();
}

class _MoviesPageViewState extends State<MoviesPageView> {
  List<String> genreList = [
    "Now Showing",
    "Coming Soon",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PRIMARY_COLOR,
          title: LocationAppBarSectionView(),
          actions: [
            SearchNotiScanSectionView()
          ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSectionView(),
            SizedBox(height: MARGIN_SMALL,),
            NowComingMoviesSectionView(genreList: genreList,)
          ],
        ),
      )

    );
  }
}

class BannerSectionView extends StatefulWidget {

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/4,
            child: PageView(
              onPageChanged: (page){
                setState((){
                  _position = page.toDouble();
                });
              },
              children: [
                BannerView(),
                BannerView(),
                BannerView(),
                BannerView()
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
          DotsIndicator(
            dotsCount: 4,
            position: _position,
            decorator: DotsDecorator(
                color: PRIMARY_HINT_COLOR,
                activeColor: SIGN_PHONE_NUMBER_BUTTON_COLOR
            ),
          )
        ],
      ),
    );
  }
}

class NowComingMoviesSectionView extends StatelessWidget {
  NowComingMoviesSectionView(
      {
    required this.genreList,
  });
  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(MARGIN_MEDIUM_2, 0, MARGIN_MEDIUM_2, 0),
            padding: EdgeInsets.all(8.0),
            height: 50,
            decoration: BoxDecoration(
                color: MOVIES_TAB_COLOR,
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: TabBar(
              indicator: BoxDecoration(
                  color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                  borderRadius:  BorderRadius.circular(5.0)
              ) ,
              labelColor: PRIMARY_HINT_COLOR,
              unselectedLabelColor: PRIMARY_HINT_COLOR,
              tabs: genreList.map(
                      (genre) => Tab(
                    child: Text(genre),
                  )
              ).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(MARGIN_MEDIUM_2),
            height: MediaQuery.of(context).size.height/2,
            child: TabBarView(
              children: [
                NowShowingMoviesView(
                    // () =>
                    //     _navigateToMoviesDetailScreen(context)
                ),
                NowShowingMoviesView(
                    // () =>
                    //     _navigateToMoviesDetailScreen(context)

                )
                // Text("data")
              ],
            ),
          )
        ],
      ),
    );

  }

  // Future<dynamic> _navigateToMoviesDetailScreen(BuildContext context) {
  //   return Navigator.push(context, MaterialPageRoute(
  //       builder: (context) => MoviesDetailPage()
  //   )
  //   );
  // }
}






