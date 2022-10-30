import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/cinema/cinema_vo.dart';
import '../data/vos/cinema_timeslots/config_data_vo.dart';
import '../data/vos/cinema_timeslots/config_value_list_vo.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../network/api_constant.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/cast_section_view.dart';
import '../widgets/movies_detail_message_view.dart';
import '../widgets/play_button_view.dart';
import '../widgets/type_text.dart';
import 'booking_movies_view_page.dart';
import '../view_items/curve_booking_button_view.dart';

class MoviesDetailPage extends StatefulWidget {

  int movieId;
  String playMovies;

  List<ConfigDataVO>? configDataList;
  List<ConfigValueListVO>? configValueList;
  List<CinemaVO>? cinemaList;
  MoviesDetailPage(this.movieId, this.playMovies, this.configDataList, this.configValueList,this.cinemaList);

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {

  MovieModel mMovieModel = MovieModelImpl();
  MovieVO? mMovieVO;
  List<CreditCastVO>? mCastList;

  @override
  void initState(){
    super.initState();
    mMovieModel.getMovieDetail(widget.movieId)
        ?.then((movie) {
      setState((){
        this.mMovieVO = movie;
      });
    }).catchError((error) {
      debugPrint("ERROR=>${error.toString()}");
    });

    mMovieModel.getMovieDetailsFromDatabase(widget.movieId)
        .then((movie) {
      setState((){
        this.mMovieVO = movie;
      });
    }).catchError((error){
      debugPrint("ERROR=>${error.toString()}");
    });

    if(widget.playMovies == "NOW"){
      _isVisible = false;
    }else{
      _isVisible = true;
    }

    mMovieModel.getCreditCast(widget.movieId)
      .then((castList) {
      setState((){
        print("mMovieModel=>$mMovieModel");
        this.mCastList = castList;
      });
    }).catchError((error) {
      debugPrint("ERROR=>${error.toString()}");
    });
  }

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned.fill(

            child: Container(
              color: PRIMARY_COLOR,
                child: (mMovieVO !=null)
                    ?
                CustomScrollView(
                  slivers: [
                    MovieDetailsSliverAppBarView(
                            () => Navigator.pop(context),
                        mMovieVO
                    ),

                    SliverList(
                        delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: MARGIN_MEDIUM_2,),
                              MoviesReleaseDateView(mMovieVO?.releaseDate??""),
                              SizedBox(height: MARGIN_MEDIUM,),

                              Visibility(
                                visible: _isVisible,
                                child: MovieDetailMessageView(),
                              ),

                              SizedBox(height: MARGIN_MEDIUM,),
                              StoryLineView(mMovieVO?.overview??""),
                              SizedBox(height: MARGIN_MEDIUM,),

                              CastSectionView(
                                  castList: mCastList??[]
                              ),

                            ]
                        )
                    )
                  ],
                )
                    : Center(
                  child: CircularProgressIndicator(),
                )
            ),
        ),

        Positioned(
          // alignment: Alignment.bottomRight,

          bottom: 1,
          right: 10,
          left: 10,
          child: Column(
            children: [
              GestureDetector(
                  onTap: (){
                    _navigateToBookingMoviesScreen(context,widget.configDataList??[],widget.configValueList??[],widget.cinemaList??[],mMovieVO);
                  },
                  child: Container(
                      width: 200,
                      child: CurveBookingButtonView("Booking",Colors.black,SIGN_PHONE_NUMBER_BUTTON_COLOR)
                  )
              ),
              SizedBox(height: MARGIN_MEDIUM_2,),
            ],
          ),
        )
      ],
    );
  }

  Future<dynamic> _navigateToBookingMoviesScreen(BuildContext context, List<ConfigDataVO> configDataList, List<ConfigValueListVO>? configValueList,List<CinemaVO> cinemaList,  MovieVO? mMovieVO
  ) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookingMoviesViewPage(configDataList: configDataList, configValueList: configValueList, cinemaList: cinemaList,mMovieVO: mMovieVO,)
    )
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {

  final Function onTapBack;
  MovieVO? mMovie;
  MovieDetailsSliverAppBarView(this.onTapBack,this.mMovie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height/3.5,
              child: MovieDetailsAppBarImageView(mMovie?.backDropPath??"")
            ), //Positioned
            /** Positioned WIdget **/

            Positioned(
              top: 160,
              left: 16,
              child:
              ImageOverlapView(mMovie?.posterPath??"")

            ), //Positioned

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_XXLARGE,
                    left: MARGIN_MEDIUM_2
                ),
                child: BackButtonView(
                        () => onTapBack()
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_XXLARGE+MARGIN_MEDIUM,
                    right: MARGIN_MEDIUM_LARGE
                ),
                child: ShareButtonView(),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_LARGE
                  ),
                // color: PRIMARY_COLOR,
                height: 220,
                width: MediaQuery.of(context).size.width/1.6,
                child: MoviesTypesView(
                  movieVO: mMovie,
                ),
              )
              ),
          ],
        ),
      ),
    );
  }
}

class ImageOverlapView extends StatelessWidget {
  String mImageUrl;
  ImageOverlapView(this.mImageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Image.network(
            "$IMAGE_BASE_URL$mImageUrl",
            height: BEST_ACTOR_HEIGHT,
            fit: BoxFit.cover,
         ),
        ],
      ),
    );
  }
}

class MoviesTypesView extends StatelessWidget {

  MovieVO? movieVO;

  MoviesTypesView({this.movieVO});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              TypeText(movieVO?.originalTitle??"", Colors.white, TEXT_REGULAR,isFontWeight: true),
              SizedBox(width: MARGIN_SMALL,),

              Image.asset("assets/images/images_im.png",width: 45,height: 35,),
              SizedBox(width: 4,),
              TypeText(movieVO?.voteAverage.toString()??"", Colors.white, TEXT_REGULAR,isFontWeight: true),

              // Container(
              //   child: Wrap(
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Image.asset("assets/images/images_im.png",width: 45,height: 35,),
              //       SizedBox(width: 4,),
              //       TypeText(movieVO?.voteAverage.toString()??"", Colors.white, TEXT_REGULAR,isFontWeight: true),
              //     ],
              //   ),
              // )
            ],
          ),

          TypeText("2D,3D,3D IMAX,3D DBOX",Colors.white,TEXT_REGULAR,isFontWeight: true,),
          MoviesTypesList(
              genreList: movieVO?.genres?.map((genre) => genre.name).toList()?? []
          ),
        ],
      ),
    );
  }
}

class MoviesTypesList extends StatelessWidget {
  const MoviesTypesList({
    Key? key,
    required this.genreList,
  }) : super(key: key);
  final List<String?> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:
            genreList.map((genre) => GenreChipView(genre??""))
                .toList()
    );
  }
}

class GenreChipView extends StatelessWidget {

  final String genreText;
  GenreChipView(this.genreText);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,

      children: [
        Chip(
            backgroundColor: SIGN_PHONE_NUMBER_BUTTON_COLOR,
            label: Text(
              genreText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
        SizedBox(width: MARGIN_SMALL,)
      ],
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;
  BackButtonView(this.onTapBack);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
        onTapBack();
      },
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      );
  }
}

class ShareButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.share_rounded,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {

  String mImageUrl;
  MovieDetailsAppBarImageView(this.mImageUrl);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Image.network(
              "$IMAGE_BASE_URL$mImageUrl",
              height: MediaQuery.of(context).size.height/3,//2,
              fit: BoxFit.cover,
            )
        ),
        Align(
          alignment: Alignment.center,
            child: PlayButtonView()
        )
      ],
    );
  }
}

class MoviesReleaseDateView extends StatelessWidget {

  String releaseDate;
  MoviesReleaseDateView(this.releaseDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Flexible(
          child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MoviesDurationView("Censor Rating","U/A"),
          Spacer(),
          MoviesDurationView("Release date", releaseDate),
          Spacer(),
          MoviesDurationView("Duration","2hr 15min")
        ],
        )
      ),
    );
  }
}

class MoviesDurationView extends StatelessWidget {
  
  final String text_1;
  final String text;
  MoviesDurationView(this.text_1,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MARGIN_MEDIUM,MARGIN_MEDIUM_2,MARGIN_MEDIUM,MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(34, 34, 34, 1.0),
                Color.fromRGBO(17, 17, 17, 1.0)
          ]
          )
      ),

      child: Column(
        children: [
          TypeText(text_1, Colors.white, TEXT_REGULAR_SMALL,isFontWeight: true,),
          SizedBox(height: MARGIN_SMALL,),
          TypeText(text, Colors.white, TEXT_REGULAR,isFontWeight: true,)

        ],
      ),
    );
  }
}

class StoryLineView extends StatelessWidget {
 String storyLineBody;
 StoryLineView(this.storyLineBody);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText("Story Line",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM_2,),
          Text(
            storyLineBody,
            style: TextStyle(
              decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: TEXT_REGULAR,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
        ],
      ),
    );
  }
}



