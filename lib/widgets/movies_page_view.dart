import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../pages/home_navidation_view_page.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewsitems/banner_view.dart';
import '../viewsitems/search_movies_items_view.dart';

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

      body: Column(
        children: [
          BannerSectionView(),
          SizedBox(height: MARGIN_SMALL,),
          NowComingMoviesSectionView(genreList: genreList,),
          SizedBox(height: MARGIN_MEDIUM_2,),
          Expanded(
            child: ListView(
              children: [
                NowShowingComingMoviesItemsView()
              ],
            ),
          ),
        ],
      ),
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
            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),

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
        ],
      ),
    );
  }
}

class NowShowingComingMoviesItemsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),

      child: GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: SearchMoviesItemsView(),
          );
        },
      ),
    );
  }
}







