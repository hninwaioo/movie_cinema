import 'package:flutter/material.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';
import 'package:movie_cinema/resources/colors.dart';
import 'package:movie_cinema/resources/dimens.dart';
import 'package:movie_cinema/widgets/type_text.dart';

import '../data/model/movie_model.dart';
import '../data/model/movie_model_impl.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/snack/add_snack_list_vo.dart';
import 'check_out_view_page.dart';

class SnackFoodTypesViewPage extends StatefulWidget {
  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;

  SnackFoodTypesViewPage({
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate
  });

  @override
  State<SnackFoodTypesViewPage> createState() => _SnackFoodTypesViewPageState();
}

class _SnackFoodTypesViewPageState extends State<SnackFoodTypesViewPage> {
  MovieModel mMovieModel = MovieModelImpl();
  List<SnackCategoriesVO>? snackCategoriesList;
  List<SnackVO>? snackList;
  String token = "Bearer 14677|TBdKG0ByjbrAmkHX3317oN1aMljYh1nZK1Ug5M86";

  List<String?> categoriesList = ["All"];

  List<AddSnackListVO> addSnackListVO = [];
  // List<MyItem> myItemsList = new List();

  int totalFoodPrice = 0;

  @override
  void initState(){
    super.initState();

    mMovieModel.getSnackCategories(token)
    .then((categories){
      setState((){
        this.snackCategoriesList = categories;
        print("object>${snackCategoriesList?.map((e) => e.title).toList()}");
        categoriesList.addAll(snackCategoriesList?.map((e) => e.title).toList() as List<String?>);
        print("Object=>${categoriesList}");
      });
    }).catchError((error) {
      debugPrint("ERROR=>${error.toString()}");
    });

    mMovieModel.getAllSnack(token)
    .then((allSnack){
      setState((){
        this.snackList = allSnack;
      });
    }).catchError((error){
      debugPrint("ERROR=>${error.toString()}");
    });

  }

  void _getSnackByGenreAndRefresh(String token,int genreId){

    if(genreId == 0){

      mMovieModel.getAllSnack(token)
          .then((allSnack){
        setState((){
          this.snackList = allSnack;
        });
      }).catchError((error){
        debugPrint("ERROR=>${error.toString()}");
      });

    }else {

      mMovieModel.getCategoriesSnack(token,genreId).then((snackByGenre){
        setState((){
          this.snackList = snackByGenre;
        });
      }).catchError((error){
        debugPrint(error.toString());
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        title: BackBtnAppBarView(),
        actions: [
          SkipAppBarViewPage()
        ],
      ),

      body: Column(
          children:[
            FoodTypeGenreSectionView(
                genreList: categoriesList,
                onTapGenre: (genreId) {
                  print("GenreId===>${genreId}");
                  _getSnackByGenreAndRefresh(token,genreId);
                }
            ),

            Expanded(
                child: (snackList != null)
                    ?
                ListView(
                  children: [
                    FoodItemsView(
                      snackList,
                        (addSnackList) {

                        setState((){
                          print("objectName==${addSnackList.snackName}");

                          final foodType = addSnackListVO.where((element) =>
                          element.snackName == addSnackList.snackName);

                          if (foodType.isNotEmpty) {
                            print('Using where: ${foodType.first}');
                          }else{
                            print("object");
                            addSnackListVO.add(addSnackList);

                            for (var i = 0; i < addSnackListVO.length; i++) {
                              totalFoodPrice = addSnackListVO[i].totalPrice + totalFoodPrice ;
                              print("TotalPrice=>${totalFoodPrice}");

                            }
                            print("TotalPrice==>${totalFoodPrice}");

                          }

                        });
                          // addSnackListVO.add(addSnackList);

                          // var d = addSnackListVO?.map((e) => e.snackName);
                          // print("objectName=${addSnackListVO?.singleWhere((it) => it.snackName == addSnackList.snackName)}");


                        }
                    )
                  ],
                ): Center(
                  child: CircularProgressIndicator(),
                )
            ),

            // Expanded(
            //   child: ListView(
            //     children: [
            //       FoodItemsView(snackList)
            //     ],
            //   ),
            // ),

            SizedBox(height: MARGIN_MEDIUM_LARGE,),

              Align(
                  alignment: FractionalOffset.bottomCenter,

                    child: FoodChoosedItemsView(
                      mMovieVO: widget.mMovieVO,
                        cinemaDayTimeSlots: widget.cinemaDayTimeSlots,
                        startTime: widget.startTime,
                        completeDate: widget.completeDate,
                        addSnackListVO: addSnackListVO,
                      totalFoodPrice: totalFoodPrice,

                    ),

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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          // Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
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
  FoodTypeGenreSectionView({
    required this.genreList,
    required this.onTapGenre
  });

  final List<String?> genreList;
  // final Function onTapMovie;
  final Function (int) onTapGenre;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genreList.length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: PLAY_BUTTON_COLOR,
        unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
        onTap: (index){
          this.onTapGenre(index);
        },
        tabs: genreList.map(
                (genre) => Tab(
              child: Text(genre??""),
            )
        ).toList(),
      ),
    );

  }
}

class SnackItemsView extends StatefulWidget {

  SnackVO? snacks;

  final Function(AddSnackListVO) onTapMovie;

  SnackItemsView(this.snacks,this.onTapMovie);

  @override
  State<SnackItemsView> createState() => _SnackItemsViewState();
}

class _SnackItemsViewState extends State<SnackItemsView> {
  List<AddSnackListVO>? addSnackList = [];
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

          Image.network(widget.snacks?.image??"",height: 80,
          width: 100,),

          Align(
            alignment: Alignment.topLeft,
            child:
            TypeText(widget.snacks?.name??"", Colors.white, TEXT_REGULAR,isFontWeight: false,),

          ),
          SizedBox(height: MARGIN_SMALL,),
          Align(
            alignment: Alignment.topLeft,
            child:
            TypeText("${widget.snacks?.price} Ks", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X),

          ),
          SizedBox(height: MARGIN_SMALL,),
          ElevatedButton(
              onPressed: (){

                AddSnackListVO addSnack = AddSnackListVO(id: widget.snacks?.id??0,quantity: 1,snackName: widget.snacks?.name??"",totalPrice: widget.snacks?.price??0);

                widget.onTapMovie(addSnack);
                  print("movieItemTap");

                // print("AddSnack=>${widget.snacks?.name}");
                // addSnackList = [AddSnackListVO(
                //     snackName: widget.snacks?.name,
                //     number: 1,
                //     totalPrice: widget.snacks?.price
                // ),
                // ];
                // // addSnackList?.add(addSnack);
                //
                // print("AddSnackList=>${addSnackList}");

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

  int totalFoodPrice;
  Function onBottomSheet;
  Function goToCheck;
  FoodPriceTotalView(this.totalFoodPrice,{required this.onBottomSheet, required this.goToCheck});

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
          GestureDetector(
            onTap: (){
              onBottomSheet();
            },
            child: Row(
              children: [
                Image.asset("assets/images/online_food_icon.png",
                  color: Colors.black,),
                SizedBox(width: MARGIN_SMALL,),

                Image.asset("assets/images/down_arrow_icon.png",
                  color: Colors.black,),
              ],
            ),
          ),

          Spacer(),

          GestureDetector(
            onTap: (){
              goToCheck();
            },
            child: Row(
              children: [
                TypeText("${totalFoodPrice} Ks", Colors.black, TEXT_REGULAR_1X,isFontWeight: true,),
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
          )
        ],
      ),
    );
  }
}

class FoodItemsView extends StatelessWidget {

  List<SnackVO>? snackList;
  final Function(AddSnackListVO) onTapMovie;
  // final Function (int) onTapGenre;

  FoodItemsView(this.snackList,this.onTapMovie);

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
        itemCount: snackList?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: (snackList!= null)
              ?
            SnackItemsView(
              snackList?[index],
                  (addSnackList){
                this.onTapMovie(addSnackList);
              },
            )
                :
                CircularProgressIndicator()
          );
        },
      ),
    );
  }
}

class FoodChoosedItemsView extends StatefulWidget {

  MovieVO? mMovieVO;
  int? cinemaDayTimeSlots;
  String? startTime;
  String? completeDate;
  int totalFoodPrice;

  List<AddSnackListVO> addSnackListVO;

  FoodChoosedItemsView({
    required this.mMovieVO,
    required this.cinemaDayTimeSlots,
    required this.startTime,
    required this.completeDate,
    required this.addSnackListVO,
    required this.totalFoodPrice});

  @override
  State<FoodChoosedItemsView> createState() => _FoodChoosedItemsViewState();
}

class _FoodChoosedItemsViewState extends State<FoodChoosedItemsView> {

  // List<AddSnackListVO>? addSnackList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        color: PRIMARY_COLOR,
      ),

      child: Column(

        children: [

          SizedBox(height: MARGIN_MEDIUM,),
          GestureDetector(
            onTap: (){
              // _navigateToCheckOutScreen(context);
            },
            child: FoodPriceTotalView(
              widget.totalFoodPrice,
              onBottomSheet: (){
                showModalBottomSheet(
                    context: context,
                    backgroundColor: PRIMARY_COLOR,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return
                        Container(
                        // color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                        height: 200,
                        padding: EdgeInsets.all(16.0),
                        child:
                        ListView.builder(
                          padding: EdgeInsets.only(left: MARGIN_SMALL),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.addSnackListVO.length,
                          // itemBuilder:
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                child: (widget.addSnackListVO != null)
                                    ?
                                FoodSelectedItemsView(
                                  widget.addSnackListVO[index],
                                )
                                    : CircularProgressIndicator()
                              // SnackItemsView(snackList?[index]),
                            );
                          },
                        ),
                        // Text("DAta"),
                      );
                    });
              },

              goToCheck: (){
                _navigateToCheckOutScreen(
                    context,
                    widget.mMovieVO,
                    widget.cinemaDayTimeSlots??0,
                    widget.startTime??"",
                    widget.completeDate??"",
                    widget.addSnackListVO);
              },
            )
          )
        ],
      ),
    );
  }
  Future<dynamic> _navigateToCheckOutScreen(
      BuildContext context,
      MovieVO? mMovieVO,
      int cinemaDayTimeSlots,
      String startTime,
      String completeDate,
      List<AddSnackListVO> addSnackListVO
      ) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => CheckOutDialogViewPage(
          mMovieVO: mMovieVO,
          cinemaDayTimeSlots: cinemaDayTimeSlots,
          startTime: startTime,
          completeDate: completeDate,
          addSnackListVO: addSnackListVO,)
    )
    );
  }
}

class FoodSelectedItemsView extends StatefulWidget {

  AddSnackListVO addSnackListVO;
  FoodSelectedItemsView(this.addSnackListVO);

  @override
  State<FoodSelectedItemsView> createState() => _FoodSelectedItemsViewState();
}

class _FoodSelectedItemsViewState extends State<FoodSelectedItemsView> {

  var itemCount = 1;
  var item_count_price = 0;

  @override
  void initState(){
    super.initState();
    itemCount = widget.addSnackListVO.quantity;
    item_count_price = widget.addSnackListVO.totalPrice;
  }

  void increaseNumberCount(){
    if(itemCount>=1){
      setState((){
        itemCount ++;
        // = widget.addSnackListVO.number ++;
        print("IncreaseNumber=>${itemCount}");
        item_count_price = widget.addSnackListVO.totalPrice * itemCount;
        print("IncreaseNumberPrice=>${item_count_price}");

      });
    }
  }

  void decreaseNumberCount() {
    // decreaseNumber;
    setState(() {
      if (itemCount > 1) {
        itemCount --;
        // = widget.addSnackListVO.number --;
        print("DecreaseNumber=>${itemCount}");
        item_count_price = widget.addSnackListVO.totalPrice * itemCount;
        print("DecreaseNumberPrice=>${item_count_price}");
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          TypeText(widget.addSnackListVO.snackName, Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: (){
                  increaseNumberCount();
                },
                child: Image.asset("assets/images/plus_icon.png"),
              ),

              Center(
                child: TypeText("${itemCount}", SIGN_PHONE_NUMBER_BUTTON_COLOR, TEXT_REGULAR_1X,isFontWeight: true,),
              ),

              GestureDetector(
                onTap: (){
                  decreaseNumberCount();
                },
                child: Image.asset("assets/images/minus_icon.png"),
              ),
            ],
          ),
          Spacer(),
          TypeText("${item_count_price} Ks", Colors.white, TEXT_REGULAR_1X,isFontWeight: true,),
        ],
      ),
    );
  }
}











