import 'package:flutter/material.dart';
import 'package:sipbara/page/dashboard/profile_page_admin.dart';
import 'package:sipbara/page/menu/event_page.dart';
import 'package:sipbara/page/menu/other_page.dart';
import 'package:sipbara/page/menu/profile_page.dart';
import 'package:sipbara/page/menu/home/wisata_page.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/controller/auth.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;

  final screens = [
    WisataPage(),
    EventPage(),
    OtherPage(),
    CekAdmin(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => Center(
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: SIPColor.primaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? SIPColor.primaryColor
                        : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.event_rounded,
    Icons.fastfood_rounded,
    Icons.person_rounded,
  ];
}

class CekAdmin extends StatelessWidget {
  const CekAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isAdmin(),
        builder: (context, snapshot) => snapshot.hasData
            ? snapshot.data != false
                ? ProfilePageAdmin()
                : ProfilePage()
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
