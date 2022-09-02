import 'package:flutter/material.dart';
import 'package:video_player_app/audio_player/music_player_screen.dart';
import 'package:video_player_app/ui/common/constants.dart';
import 'package:video_player_app/ui/discover_screen.dart';

class TabBarListScreen extends StatefulWidget {
  const TabBarListScreen({Key? key}) : super(key: key);

  @override
  State<TabBarListScreen> createState() => _TabBarListScreenState();
}

class _TabBarListScreenState extends State<TabBarListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: AllColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AllColors.whiteColor,
          title: const Text(
            'Discover',
            style: TextStyle(color: AllColors.blackColor, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: FontFamily.poppins),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(
                Icons.search_rounded,
                color: AllColors.blackColor,
                size: 25,
              ),
            )
          ],
          bottom: const TabBar(
            labelColor: AllColors.blackColor,
            unselectedLabelColor: AllColors.greyLightColor,
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.raleway,
              fontWeight: FontWeight.w800,
            ),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              width: 3,
              color: Colors.amber,
            )),
            tabs: <Widget>[
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Songs",
              ),
              Tab(
                text: "Albums",
              ),
              Tab(
                text: "Artists",
              ),
            ],
          ),
          elevation: 0,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AllColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            indicatorColor: AllColors.blackColor,
            overlayColor: MaterialStateProperty.all<Color>(const Color(0xff545358)),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.all(0),
            indicatorPadding: const EdgeInsets.all(7),
            labelColor: AllColors.blackColor,
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            unselectedLabelColor: AllColors.greyColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.my_library_music),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.cloud_download_rounded),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MusicPlayerScreen(),
            DiscoverScreen(),
            Center(
              child: Text("It's Albums here"),
            ),
            Center(
              child: Text("It's Artists here"),
            ),
          ],
        ),
      ),
    );
  }
}
