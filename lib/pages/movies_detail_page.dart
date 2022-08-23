import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/cast_section_view.dart';
import '../widgets/movies_detail_message_view.dart';
import '../widgets/play_button_view.dart';
import '../widgets/type_text.dart';
import 'booking_movies_view_page.dart';

class MoviesDetailPage extends StatelessWidget {
  const MoviesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailsSliverAppBarView(
                    () => Navigator.pop(context)
            ),

            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: MARGIN_MEDIUM_2,),
                      MoviesReleaseDateView(),
                      SizedBox(height: MARGIN_MEDIUM,),
                      MovieDetailMessageView(),
                      SizedBox(height: MARGIN_MEDIUM,),
                      StoryLineView(),
                      SizedBox(height: MARGIN_MEDIUM,),
                      CastSectionView(),
                      GestureDetector(
                        onTap: (){
                          _navigateToBookingMoviesScreen(context);
                        },
                        child: Image.asset("assets/images/booking_btn.png"),
                      ),
                      SizedBox(height: MARGIN_MEDIUM_2,),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _navigateToBookingMoviesScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookingMoviesViewPage()
    )
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {

  final Function onTapBack;
  MovieDetailsSliverAppBarView(this.onTapBack);

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
              child: MovieDetailsAppBarImageView()
              // Icon(Icons.message,
              //     size: 128.0, color: Colors.greenAccent[400]), //Icon
            ), //Positioned
            /** Positioned WIdget **/

            Positioned(
              top: 150,
              left: 8,
              child: ImageOverlapView()

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
                    right: MARGIN_MEDIUM_2
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
                      left: MARGIN_MEDIUM_2
                  ),
                // color: PRIMARY_COLOR,
                height: 120,
                width: MediaQuery.of(context).size.width/1.7,
                child: MoviesTypesView(genreList: genreList,),
              )
              ),
          ],
        ),
      ),
    );
  }
}

class ImageOverlapView extends StatelessWidget {
  // final List<String> genreList = [
  //   "Action",
  //   "Adventure",
  //   "Drama",
  //   "Animation"
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network("https://rukminim1.flixcart.com/image/416/416/k0bbb0w0/poster/u/h/a/medium-cute-minions-cartoon-wall-poster-for-children-high-original-imafk4xygze3chhh.jpeg?q=70",
            height: BEST_ACTOR_HEIGHT,
         ),
          // SizedBox(width: MARGIN_MEDIUM_2,),
          // MoviesTypesView(genreList: genreList,)
        ],
      ),
    );
  }
}

class MoviesTypesView extends StatelessWidget {

  const MoviesTypesView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MARGIN_MEDIUM, 0, 0),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TypeText("Minions", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
              SizedBox(width: MARGIN_MEDIUM,),
              Container(
                child: Row(
                  children: [
                    Image.asset("assets/images/images_im.png",width: 45,height: 35,),
                    TypeText("9.8", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),

          TypeText("2D,3D,3D IMAX,3D DBOX",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
          MoviesTypesList(genreList: genreList),
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
  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:
            genreList.map((genre) => GenreChipView(genre))
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

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://static1.squarespace.com/static/5591682fe4b0866b94533feb/t/56267c1ce4b030c0a6a34cc1/1445362716418/1000w/",
      height: MediaQuery.of(context).size.height/3,
      fit: BoxFit.cover,
    );
  }
}

class MoviesReleaseDateView extends StatelessWidget {
  const MoviesReleaseDateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM),
      child: Flexible(
          child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MoviesDurationView("Censor Rating","U/A"),
          // SizedBox(width: MARGIN_SMALL,),
          Spacer(),
          MoviesDurationView("Release date","May 3th 2022"),
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
      padding: EdgeInsets.all(MARGIN_MEDIUM),
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
  const StoryLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeText("Story Line",Colors.white,TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM_2,),
          Text("Clare, a young Irish convict, chases a British officer through the rugged Tasmanian wilderness and is bent on revenge for a terrible act of violence the man committed against her family. On the way, she enlists the services of Aboriginal tracker Billy, who is marked by trauma from his own violence-filled past.",
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



