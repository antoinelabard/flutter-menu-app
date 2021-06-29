import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/burger_page.dart';
import 'package:menu_app/food_tabs.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0),
                      ],
                      color: Color(0xffc6e7fe),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/tuxedo.png'),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              '''SEARCH FOR
RECIPES''',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 15.0),
          //   child: Text(
          //     'RECIPES',
          //     style: GoogleFonts.notoSans(
          //         fontWeight: FontWeight.w800, fontSize: 27.0),
          //   ),
          // ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(
                      fontSize: 14.0,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(.5),
                    prefixIcon: Icon(Icons.search, color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem("hamburg", "assets/burger.png", "21",
                    Color(0xffffe9c6), Color(0xFFDA9551)),
                _buildListItem('Chips', 'assets/fries.png', '15',
                    Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                _buildListItem('Donuts', 'assets/doughnut.png', '15',
                    Color(0xFFD7FADA), Color(0xFF56CC7E)),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16.0, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                    imgPath: imgPath,
                    foodName: foodName,
                    heroTag: foodName,
                    pricePerItem: price,
                  )));
        },
        child: Container(
          width: 150.0,
          height: 175.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              ),
              Text(
                price + "€",
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
