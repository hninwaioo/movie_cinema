import 'package:flutter/material.dart';
import 'package:movie_cinema/pages/profile_view_page.dart';
import 'package:movie_cinema/pages/search_movies_view_page.dart';
import 'package:movie_cinema/pages/ticket_list_view_page.dart';
import 'package:movie_cinema/resources/dimens.dart';
import '../resources/colors.dart';
import '../widgets/movies_page_view.dart';
import '../widgets/type_text.dart';

class HomeNavigationViewPage extends StatefulWidget {
  const HomeNavigationViewPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationViewPage> createState() => _HomeNavigationViewPageState();
}

class _HomeNavigationViewPageState extends State<HomeNavigationViewPage> {

  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 =  MoviesPageView();
    _page2 =  TypeText("MMMM",SIGN_PHONE_NUMBER_BUTTON_COLOR,16.0);
    _page3 =  TicketListViewPage();
    _page4 = ProfileViewPage();
    _pages = [_page1, _page2, _page3, _page4];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _currentPage,
      bottomNavigationBar:
             BottomNavigationBar(
                backgroundColor: PRIMARY_COLOR,
               type: BottomNavigationBarType.fixed,
               onTap: (index) {
                 _changeTab(index);
                 print(index);
               },
               currentIndex: _currentIndex,

               items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/nav_video.png"),
                    ),
                    label: 'Movies',

                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/nav_cinema.png"),
                    ),
                    label: 'Cinema',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/nav_ticket.png"),
                    ),
                    label: 'Ticket',
                  ),
                  BottomNavigationBarItem(
                    // icon: ImageIcon(Icons.airplane_ticket),
                    icon: ImageIcon(
                      AssetImage("assets/images/nav_profile.png"),
                    ),
                    label: 'Profile',
                  ) ,
                ],
                selectedItemColor: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                unselectedItemColor: PRIMARY_HINT_COLOR,

              ),
    
    );
  }
}


class SearchNotiScanSectionView extends StatelessWidget {
  const SearchNotiScanSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              _navigateToSearchMoviesViewScreen(context);
            },
            child: Icon(Icons.search_outlined),
          ),
          SizedBox(width: MARGIN_MEDIUM_2,),
          Icon(Icons.notifications),
          // Icon(Icons.settings_overscan_outlined)
          ImageIcon(
            AssetImage("assets/images/scan_icon.png"),size: 60,color: Colors.white,
          ),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToSearchMoviesViewScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => SearchMoviesViewPage()
    )
    );
  }
}

class LocationAppBarSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Image.asset("assets/images/location_arrow.png",
            color: Colors.white,),
            SizedBox(width: MARGIN_MEDIUM,),
            Text("Yangon",
              style: TextStyle(
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w500
              ),)

          ],
        ),
      );
  }
}

