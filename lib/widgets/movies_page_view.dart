import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/cinema/cinema_vo.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/config_data_vo.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/banner_vo.dart';
import '../data/vos/cinema_timeslots/config_value_list_vo.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../pages/home_navigation_view_page.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/banner_view.dart';
import '../view_items/search_movies_items_view.dart';

class MoviesPageView extends StatefulWidget {
  const MoviesPageView({Key? key}) : super(key: key);

  @override
  State<MoviesPageView> createState() => _MoviesPageViewState();
}

class _MoviesPageViewState extends State<MoviesPageView> {

  MovieModel mMovieModel = MovieModelImpl();

  List<ConfigDataVO>? configDataList;
  List<ConfigValueListVO>? configValueList;

  List<CinemaVO>? cinemaList;

  List<BannerVO>? mBannersList;
  List<MovieVO>? mPlayingMovieList;
  String? playMovies = "NOW";
  bool _dateVisible = false;

  List<String> genreList = [
    "Now Showing",
    "Coming Soon",
  ];

  @override
  void initState() {
    super.initState();

    /// Banner Movies
    // mMovieModel.getBannerMovies().then((bannerList) {
    //   setState(() {
    //     mBannersList = bannerList;
    //     print("mBannerList==<${mBannersList}");
    //   });
    // }).catchError((error) {
    //   debugPrint("ERROR=>>${error.toString()}");
    // });

    mMovieModel.getBannerMoviesFromDatabase().listen((bannerList){
      setState((){
        mBannersList = bannerList;
      });
    }).onError((error){
      debugPrint("ERROR=>>${error.toString()}");
    });

    playMovies = "NOW";
    _dateVisible = false;

    // mMovieModel.getNowPlayingMovies(1).then((movieList) {
    //   setState(() {
    //     mPlayingMovieList = movieList;
    //     print("mNowPlayingMovieFirst==>${mPlayingMovieList}");
    //   });
    // }).catchError((error) {
    //   debugPrint("ERROR=>${error.toString()}");
    // });

    /// Now and Coming Soon Movies Database
    mMovieModel.getNowPlayingMoviesFromDatabase().listen((movieList){
      setState(() {
        mPlayingMovieList = movieList;
      });
    }).onError((error) {
      debugPrint("ERROR=>${error.toString()}");
    });

    /// getConfig API
    mMovieModel.getConfig().then((config) {
      setState((){
        configDataList = config;
        List valueList = config?.first.value;
        configValueList = valueList.map((value) => ConfigValueListVO.fromJson(value)).toList();
        print("cinemaTimeslotStatusList=${configValueList}");

      });
    }).catchError((error){
      debugPrint("Error=>${error.toString()}");
    });

    /// getConfig DATABASE
    mMovieModel.getConfigFromDatabase().listen((config) {
      setState((){
        configDataList = config;
        List valueList = config?.first.value;
        configValueList = valueList.map((value) => ConfigValueListVO.fromJson(value)).toList();
        print("cinemaTimeslotStatusList=${configValueList}");
      });
    }).onError((error){
      debugPrint("Error=>${error.toString()}");
    });

    /// getCinemaList API
    mMovieModel.getCinemaList().then((cinema) {
      setState((){
        cinemaList = cinema;
        // print("CinemaList==>${_cinemaResponse}");
      });
    }).catchError((error){
      debugPrint("Error=>${error.toString()}");
    });

    /// getCinemaList DATABASE
    mMovieModel.getCinemaListFromDatabase().listen((cinema) {
      setState((){
        cinemaList = cinema;
        print("CinemaList==>${cinema}");
      });
    }).onError((error){
      debugPrint("Error=>${error.toString()}");
    });
  }

  void _getNowAndComingSoonMovies(int index) {

      if(index == 0){
        /// Now Playing Movies
        // mMovieModel.getNowPlayingMovies(1).then((movieList) {
        //   setState(() {
        //     mPlayingMovieList = movieList;
        //     print("mNowPlayingMovie==>${mPlayingMovieList}");
        //   });
        // }).catchError((error) {
        //   debugPrint("ERROR=>${error.toString()}");
        // });

        /// Now and Coming Soon Movies Database
        mMovieModel.getNowPlayingMoviesFromDatabase().listen((movieList){
          setState(() {
            mPlayingMovieList = movieList;
          });
        }).onError((error) {
          debugPrint("ERROR=>${error.toString()}");
        });

        playMovies = "NOW";
        _dateVisible = false;

      }else{
        /// Coming Soon Playing Movies
        // mMovieModel.getComingSoonPlayingMovies(1).then((movieList) {
        //   setState(() {
        //     mPlayingMovieList = movieList;
        //     print("mComingSoonPlayingMovieList==>${mPlayingMovieList}");
        //   });
        // }).catchError((error) {
        //   debugPrint("ERROR=>${error.toString()}");
        // });

        /// Now and Coming Soon Movies Database
        mMovieModel.getComingSoonPlayingMoviesFromDatabase().listen((movieList){
          setState(() {
            mPlayingMovieList = movieList;
          });
        }).onError((error) {
          debugPrint("ERROR=>${error.toString()}");
        });

        playMovies = "COMING";
        _dateVisible = true;
      }
    }

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
              BannerSectionView(
                bannerList: mBannersList?.take(5).toList()
                      ),

              SizedBox(height: MARGIN_SMALL,),

              NowComingMoviesSectionView(
                genreList: genreList,
                  onTapGenres: (genreId) {
                  print("GenreId==>${genreId}");
                  _getNowAndComingSoonMovies(genreId);
                }
              ),
              SizedBox(height: MARGIN_MEDIUM_2,),
              Container(
                // height: MediaQuery
                //     .of(context)
                //     .size
                //     .height / 3,
                child: (mPlayingMovieList != null)
                    ?
                ListView(
                  physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
                  shrinkWrap: true,
                  children: [
                    NowShowingComingMoviesItemsView(
                      movieList: mPlayingMovieList?? [],
                      onTapMovie: (movieId) {

                      },
                      playMovies: playMovies,
                      dateVisible: _dateVisible,
                      configDataList: configDataList!,
                      configValueList: configValueList,
                      cinemaList: cinemaList,
                      // _navigateToMoviesDetailScreen(context,movieId),
                      // onTapMovie: (genreId) => _getNowAndComingSoonMovies(genreId),
                    )
                  ],
                ): Center(
                  child: CircularProgressIndicator(),
                )
              )
            ],
          ),
        ),
      );
    }
}

class BannerSectionView extends StatefulWidget {

  List<BannerVO>? bannerList;
  BannerSectionView({required this.bannerList});

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
                pageSnapping: true,
                clipBehavior : Clip.antiAlias,
              onPageChanged: (page){
                setState((){
                  _position = page.toDouble();
                });
              },
              children: widget.bannerList?.map((bannerMovies) => BannerView(
                bannerVO: bannerMovies,
              ))
                  .toList() ?? []

            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
          DotsIndicator(
            dotsCount: widget.bannerList?.length?? 1,
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
        required this.onTapGenres,
  });
  final List<String> genreList;
  final Function (int) onTapGenres;

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
              onTap: (index){
                this.onTapGenres(index);
              },
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
  final Function(int) onTapMovie;
  final List<MovieVO> movieList;
  String? playMovies;
  bool dateVisible;
  // ConfigResponse configResponse;
  List<ConfigDataVO>? configDataList;
  List<ConfigValueListVO>? configValueList;
  // CinemaResponse cinemaResponse;
  List<CinemaVO>? cinemaList;

  NowShowingComingMoviesItemsView({
    required this.onTapMovie,
    required this.movieList,
    required this.playMovies,
    required this.dateVisible,
    required this.configDataList,
    required this.configValueList,
    required this.cinemaList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),

      child: (movieList != null)
        ?
      GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: SearchMoviesItemsView(
                  (movieId){
                this.onTapMovie(movieId);
              },
              movieList[index],
              playMovies,
                dateVisible,
              configDataList,
                configValueList,
              cinemaList
            ),
          );
        },
      ): Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}







