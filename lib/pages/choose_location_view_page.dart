import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../resources/dimens.dart';
import 'home_navidation_view_page.dart';

class ChooseLocationViewPage extends StatefulWidget {

  @override
  State<ChooseLocationViewPage> createState() => _ChooseLocationViewPageState();
}

class _ChooseLocationViewPageState extends State<ChooseLocationViewPage> {
  get prefixIcon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/pick_region.png',
                height: 100,
              ),
            ),

            SearchLocationSectionView(prefixIcon: prefixIcon),
            Container(
              alignment: Alignment.centerRight,
              child: Image.asset("assets/images/cities_icon.png"),

            ),
            CitiesListSectionView()
          ],
        ),
      ),
    );
  }
}

class SearchLocationSectionView extends StatelessWidget {
  const SearchLocationSectionView({
    Key? key,
    required this.prefixIcon,
  }) : super(key: key);

  final  prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_MEDIUM_2),

      child: Row(
        children: [
          Expanded(
              child:
              Container(
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
                child:  TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: prefixIcon??Icon(Icons.search_outlined,color: SIGN_PHONE_NUMBER_BUTTON_COLOR,),
                    hintText: "Search your location",
                    hintStyle: TextStyle(
                        color: PRIMARY_HINT_COLOR
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),
              // Spacer(),
          GestureDetector(
              onTap: (){
                _navigateToHomeNavigationScreen(context);
                print("movieItemTap");
              },
            child: Container(
                margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                height: 45,width: 45,
                decoration: BoxDecoration(
                    color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                    borderRadius: BorderRadius.circular(
                        MARGIN_MEDIUM
                    )
                ),
                child: Image.asset("assets/images/location_arrow.png")
              // Icon("assets/images/location_arrow.png"),
            )
          )
        ],
      ),
    );
  }

  Future<dynamic> _navigateToHomeNavigationScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomeNavigationViewPage()
    )
    );
  }
}

class CitiesListSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Container(
         alignment: Alignment.topLeft,
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         width: double.infinity,
         color: PRIMARY_HINT_COLOR,
         child: TypeText(
           "Cities",
           Colors.white,
           TEXT_REGULAR_1X,
           isFontWeight: true,
         ),
       ),

       Container(
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         child: TypeText(
           "Yangon",
           Colors.white,
           TEXT_REGULAR,
           isFontWeight: true,
         ),
       ),
       Divider(
         color: PRIMARY_HINT_COLOR,
       ),
       Container(
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         child: TypeText(
           "Mandalay",
           Colors.white,
           TEXT_REGULAR,
           isFontWeight: true,
         ),
       ),
       Divider(
         color: PRIMARY_HINT_COLOR,
       ),
       Container(
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         child: TypeText(
           "Naypyidaw",
           Colors.white,
           TEXT_REGULAR,
           isFontWeight: true,
         ),
       ),
       Divider(
         color: PRIMARY_HINT_COLOR,
       ),
       Container(
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         child: TypeText(
           "Bago",
           Colors.white,
           TEXT_REGULAR,
           isFontWeight: true,
         ),
       ),
       Divider(
         color: PRIMARY_HINT_COLOR,
       ),
       Container(
         padding: EdgeInsets.all(MARGIN_MEDIUM_2),
         child: TypeText(
           "Mawlamyine",
           Colors.white,
           TEXT_REGULAR,
           isFontWeight: true,
         ),
       ),
       Divider(
         color: PRIMARY_HINT_COLOR,
       ),
     ],
    );
  }
}
