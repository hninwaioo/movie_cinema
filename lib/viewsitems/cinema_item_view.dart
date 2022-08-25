import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/resources/strings.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../pages/snack_food_types_view_page.dart';


class CinemaNameDetailView extends StatefulWidget {

  String cinema_name;
  CinemaNameDetailView(this.cinema_name);

  @override
  State<CinemaNameDetailView> createState() => _CinemaNameDetailViewState();
}

class _CinemaNameDetailViewState extends State<CinemaNameDetailView> {
  bool _isVisible = false;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: GestureDetector(
        onTap: (){
          _navigateToSnackFoodScreen(context);
        },
        child: Column(
          children: [
            Row(
              children: [
                TypeText(widget.cinema_name, Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
                Spacer(),

                GestureDetector(
                  onTap: showToast,
                  child: Text(
                    "See Details",
                    style: TextStyle(
                        color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM_LARGE,),

            Container(
              child: Row(
                children: [
                  CinemaPlaceTypesView("assets/images/parking_icon.png","Parking"),
                  SizedBox(width: MARGIN_MEDIUM_2,),
                  CinemaPlaceTypesView("assets/images/online_food_icon.png","Online Foods"),
                  SizedBox(width: MARGIN_MEDIUM_2,),
                  CinemaPlaceTypesView("assets/images/wheel_chair_icon.png","Wheel Chair")
                ],
              ),
            ),
            // SizedBox(height: MARGIN_MEDIUM_LARGE,),
            Visibility(
                visible: _isVisible,
                child: CinemaSeatAvailableView()

            )
          ],
        ),
      )
    );
  }

  Future<dynamic> _navigateToSnackFoodScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => SnackFoodTypesViewPage()
    )
    );
  }
}

class CinemaPlaceTypesView extends StatelessWidget {

  String _image;
  String _placeTypes;
  CinemaPlaceTypesView(this._image,this._placeTypes);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(_image),
          SizedBox(width: MARGIN_SMALL,),
          TypeText(_placeTypes, PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,)
        ],
      ),
    );
  }
}

class CinemaSeatAvailableView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MARGIN_MEDIUM_LARGE,),

        Container(
    child: GridView.count(
    scrollDirection: Axis.vertical,
      crossAxisCount: 3 ,
      shrinkWrap: true,
      crossAxisSpacing: MARGIN_MEDIUM,
      mainAxisSpacing: MARGIN_MEDIUM,
      children: List.generate(5,(index){
        return Container(
          child: CinemaSeatAvailable(),

        );
      }),
    ),
    ),
        SizedBox(height: MARGIN_MEDIUM,),

        Row(
          children: [
            Icon(Icons.info_rounded,color: PRIMARY_HINT_COLOR,),
            SizedBox(width: MARGIN_MEDIUM,),
            TypeText(LONG_PRESS_ACTION, PRIMARY_HINT_COLOR, TEXT_REGULAR,isFontWeight: true,)
          ],
        )
      ],
    );

  }
}


class CinemaSeatAvailable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_SMALL),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromRGBO(25, 0, 18, 1.0),
          borderRadius: BorderRadius.circular(
              5.0
          ),
          border: Border.all(width: 1,color: Colors.purple)
      ),

      child: TypeText("1:30PM\n3D\nScreen 1\n2 Available",Colors.white,TEXT_REGULAR,isFontWeight: true,),
    );
  }
}



