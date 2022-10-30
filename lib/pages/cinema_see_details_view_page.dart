import 'package:flutter/material.dart';
import '../data/vos/cinema/cinema_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/cinema_item_view.dart';
import '../widgets/type_text.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'movies_detail_page.dart';

class CinemaSeeDetailsViewPage extends StatefulWidget {

  CinemaVO cinemaVO;
  CinemaSeeDetailsViewPage(this.cinemaVO);

  @override
  State<CinemaSeeDetailsViewPage> createState() => _CinemaSeeDetailsViewPageState();
}

class _CinemaSeeDetailsViewPageState extends State<CinemaSeeDetailsViewPage> {

 late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.cinemaVO.promoVdoUrl??""),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,

        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),

          title: Center(
            child: TypeText("Cinema Details", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
          ),
        actions: [
          ImageIcon(
            AssetImage("assets/images/cinema_favourite.png"),size: 60,color: Colors.white,
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: FlickVideoPlayer(
                  flickManager: flickManager
              ),
            ),
            Container(

              margin: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM_2,horizontal: MARGIN_MEDIUM_2),
              child: TypeText(widget.cinemaVO.name??"", Colors.white, TEXT_REGULAR_2x,isFontWeight: true,),

            ),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM,horizontal: MARGIN_MEDIUM_2),
              child: Row(
                children: [
                  TypeText("Q5H3+JPP, Corner of, \n Bogyoke Lann Yangon ", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                  Spacer(),
                  Image.asset("assets/images/location_arrow.png",color: SIGN_PHONE_NUMBER_BUTTON_COLOR,)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM,horizontal: MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeText("Facilities", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.cinemaVO.facilitiesList?.length,
                          // widget.cinemaData?.facilitiesList?.length,
                          itemBuilder:(BuildContext context, int index){
                            return CinemaPlaceTypesView(
                                cinemaFacilitiesVO:
                                widget.cinemaVO.facilitiesList?[index],
                                onTapAvailable: (cinemaId){
                                  // showToast();
                                },
                              );
                          }
                      )
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MARGIN_MEDIUM,horizontal: MARGIN_MEDIUM_2),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeText("Safety", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                  SizedBox(height: MARGIN_MEDIUM,),
                  SafetyItems(
                      safetyList: widget.cinemaVO.safetyList??[]
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SafetyItems extends StatelessWidget {

  List<String?> safetyList;
  SafetyItems({required this.safetyList});

  @override
  Widget build(BuildContext context) {
    return
      Wrap(
          children:
          safetyList.map((genre) => GenreChipView(genre??""))
              .toList()
      );
  }
}


