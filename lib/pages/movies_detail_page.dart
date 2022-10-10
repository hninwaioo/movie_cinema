import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/genres_vo.dart';
import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../network/api_constant.dart';
import '../network/responses/get_cinema_response.dart';
import '../network/responses/get_config_response.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/cast_section_view.dart';
import '../widgets/movies_detail_message_view.dart';
import '../widgets/play_button_view.dart';
import '../widgets/type_text.dart';
import 'booking_movies_view_page.dart';
import '../viewsitems/curve_booking_button_view.dart';

class MoviesDetailPage extends StatefulWidget {

  int movieId;
  String playMovies;
  ConfigResponse configResponse;
  CinemaResponse cinemaResponse;
  MoviesDetailPage(this.movieId, this.playMovies, this.configResponse, this.cinemaResponse);

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
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
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

                      GestureDetector(
                        onTap: (){
                          _navigateToBookingMoviesScreen(context,widget.configResponse,widget.cinemaResponse,mMovieVO);
                        },
                        child: Container(
                            width: 100,
                            // MediaQuery.of(context).size.width/3,
                            child: CurveBookingButtonView("Booking",Colors.black,SIGN_PHONE_NUMBER_BUTTON_COLOR))
                      ),
                      SizedBox(height: MARGIN_MEDIUM_2,),
                    ]
                )
            )
          ],
        )
            : Center(
          child: CircularProgressIndicator(),
        )
      )
    );
  }

  Future<dynamic> _navigateToBookingMoviesScreen(BuildContext context, ConfigResponse configResponse, CinemaResponse cinemaResponse,  MovieVO? mMovieVO
  ) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookingMoviesViewPage(configResponse: configResponse, cinemaResponse: cinemaResponse,mMovieVO: mMovieVO,)
    )
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {

  final Function onTapBack;
  MovieVO? mMovie;
  MovieDetailsSliverAppBarView(this.onTapBack,this.mMovie);

  final List<String> genreList = [
    "Action",
    "Adventure",
    "Drama",
    "Animation"
  ];
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background:
        Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0,
              right: 0,
              child: MovieDetailsAppBarImageView(mMovie?.backDropPath??"")
            ), //Positioned
            /** Positioned WIdget **/

            Positioned(
              top: 180,
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
                alignment: Alignment.center,
                child: PlayButtonView()
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_LARGE
                  ),
                // color: PRIMARY_COLOR,
                height: 150,
                width: MediaQuery.of(context).size.width/1.5,
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
      height: 180,
      child: Row(
        children: [
          Image.network(
            // "https://rukminim1.flixcart.com/image/416/416/k0bbb0w0/poster/u/h/a/medium-cute-minions-cartoon-wall-poster-for-children-high-original-imafk4xygze3chhh.jpeg?q=70",
            "$IMAGE_BASE_URL$mImageUrl",
            height: BEST_ACTOR_HEIGHT,
         ),
        ],
      ),
    );
  }
}

class MoviesTypesView extends StatelessWidget {

  // Stri;ng? movieTitle;
  // String? voteAverage;
  // List<GenresVO>? genreList
  MovieVO? movieVO;

  MoviesTypesView({this.movieVO});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TypeText(movieVO?.originalTitle??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
              SizedBox(width: MARGIN_MEDIUM,),
              Container(
                child: Row(
                  children: [
                    Image.asset("assets/images/images_im.png",width: 45,height: 35,),
                    TypeText(movieVO?.voteAverage.toString()??"", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
                  ],
                ),
              )
            ],
          ),

          TypeText("2D,3D,3D IMAX,3D DBOX",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
          MoviesTypesList(
              // genreList: genreList??[]
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
    return Image.network(
      // "https://static1.squarespace.com/static/5591682fe4b0866b94533feb/t/56267c1ce4b030c0a6a34cc1/1445362716418/1000w/",
        "$IMAGE_BASE_URL$mImageUrl",
        height: MediaQuery.of(context).size.height/3,
        fit: BoxFit.cover,
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
          // SizedBox(width: MARGIN_SMALL,),
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
          TypeText(text_1, Colors.white, TEXT_REGULAR,isFontWeight: true,),
          SizedBox(height: MARGIN_SMALL,),
          TypeText(text, Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)

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
                color: Colors.white,
                fontSize: TEXT_REGULAR,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
        ],
      ),
    );
  }
}



