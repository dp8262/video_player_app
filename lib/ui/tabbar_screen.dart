import 'package:flutter/material.dart';
import 'package:video_player_app/ui/discover_screen.dart';
import 'package:video_player_app/ui/video_player.dart';

import 'common/constants.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color(0xff262837),


            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 10), // changes position of shadow
              ),
            ],
            // borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)
            // )
          ),
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            indicatorColor: AllColors.blackColor,
            overlayColor: MaterialStateProperty.all<Color>(const Color(0xff545358)),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.all(0),
            indicatorPadding: const EdgeInsets.all(7),
            labelColor: AllColors.blueLightColor,
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            unselectedLabelColor: AllColors.greyColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "Browse",

              ),
              Tab(
                icon: Icon(Icons.bookmark_outline),
                text: "Bookmark",

              ),
              Tab(
                icon: Icon(Icons.more_vert),
                text: "More",

              ),
            ],
          ),
        ),
        body: const TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          DiscoverScreen(),
          VideoPlayerScreen(),
          Icon(Icons.add),
          Icon(Icons.add),
        ]),
      ),
    );
  }
}
