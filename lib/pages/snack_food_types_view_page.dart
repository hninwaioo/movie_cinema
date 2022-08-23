import 'package:flutter/material.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

class SnackFoodTypesViewPage extends StatelessWidget {

  List<String> genreList = [
    "All",
    "Combo",
    "Snack",
    "Pop Corn",
    "Beverage",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,

        title: BackBtnAppBarView(),
        actions: [
          SkipAppBarViewPage()
        ],
      ),

      body: Column(
          children:[
            FoodTypeGenreSectionView(genreList),

            Expanded(
              child: ListView(
                children: [
                  FoodItemsView()
                ],
              ),
            ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

              Align(
                  alignment: FractionalOffset.bottomCenter,

                    child: FoodChoosedItemsView(),

                  // FoodPriceTotalView(),
                ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,)
          ]
      ),
    );
  }
}

class BackBtnAppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM_LARGE,),
          TypeText("Grab a bit!", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)
        ],
      ),
    );
  }
}
class SkipAppBarViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),

      child: Row(
        children: [
          Icon(Icons.search_outlined,color: Colors.white,),
          SizedBox(width: MARGIN_MEDIUM_LARGE,),
          TypeText("SKIP", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,)
        ],
      ),
    );
  }
}

class FoodTypeGenreSectionView extends StatelessWidget {
  FoodTypeGenreSectionView(this.genreList);
  final List<String> genreList;
  // final Function onTapMovie;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genreList.length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: PLAY_BUTTON_COLOR,
        unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
        tabs: genreList.map(
                (genre) => Tab(
              child: Text(genre),
            )
        ).toList(),
      ),
    );

  }
}

class SnackItemsView extends StatelessWidget {
  const SnackItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(102, 102, 102, 1.0),
                Color.fromRGBO(51, 51, 51, 1.0)
              ]
          )
      ),
      
      child: Column(
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          Image.asset("assets/images/potato_chip.png",height: 80,
          width: 60,),

          Align(
            alignment: Alignment.topLeft,
            child:
            TypeText("Potato Chips", Colors.white, TEXT_REGULAR,isFontWeight: false,),

          ),
          SizedBox(height: MARGIN_SMALL,),
          Align(
            alignment: Alignment.topLeft,
            child:
            TypeText("1500Ks", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X),

          ),
          SizedBox(height: MARGIN_SMALL,),
          ElevatedButton(
              onPressed: (){

              },
            style: ElevatedButton.styleFrom(
              primary: SIGN_PHONE_NUMBER_BUTTON_COLOR,
              padding: EdgeInsets.symmetric(horizontal: 50),
            ),
              child: TypeText("ADD",Colors.black,TEXT_REGULAR_1X)
          )
        ],
      ),
    );
  }
}

class FoodPriceTotalView extends StatelessWidget {
  const FoodPriceTotalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: SIGN_PHONE_NUMBER_BUTTON_COLOR
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset("assets/images/online_food_icon.png",
              color: Colors.black,),
              SizedBox(width: MARGIN_SMALL,),

              Image.asset("assets/images/down_arrow_icon.png",
                color: Colors.black,),
            ],
          ),
          Spacer(),
          Row(
            children: [
              TypeText("3000Ks", Colors.black, TEXT_REGULAR_1X,isFontWeight: true,),
              SizedBox(width: MARGIN_SMALL,),
              Image.asset("assets/images/right_arrow_icon.png",
                  color: Colors.black,
                height: 15,
                width: 16,
              ),
              // Icon(Icons.arrow_forward_ios_rounded,
              //   color: Colors.black,
              // size: 15,),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodItemsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM,vertical: MARGIN_MEDIUM),
      child: GridView.builder(
        physics: ScrollPhysics(),

        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.85,
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: SnackItemsView(),
          );
        },
      ),
    );
  }
}

class FoodChoosedItemsView extends StatefulWidget {
  const FoodChoosedItemsView({Key? key}) : super(key: key);

  @override
  State<FoodChoosedItemsView> createState() => _FoodChoosedItemsViewState();
}

class _FoodChoosedItemsViewState extends State<FoodChoosedItemsView> {

  bool _isVisible = true;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        color: PRIMARY_COLOR,
      ),

      child: Column(

        children: [
          Visibility(
            visible: _isVisible,
            child: Column(
              children: [
                FoodSelectedItemsView(),
                FoodSelectedItemsView()
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          GestureDetector(
            onTap: showToast,
            child: FoodPriceTotalView()
          )
        ],
      ),
    );
  }
}

class FoodSelectedItemsView extends StatelessWidget {
  const FoodSelectedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TypeText("Large Cola", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
          Row(
            children: [
              Image.asset("assets/images/plus_icon.png"),
              Spacer(),
              TypeText("1", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
              Spacer(),
              Image.asset("assets/images/minus_icon.png")
            ],
          ),
          TypeText("1000Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
        ],
      ),
    );
  }
}











