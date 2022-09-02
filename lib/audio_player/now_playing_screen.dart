import 'package:flutter/material.dart';
import 'package:video_player_app/ui/common/constants.dart';

import 'audio_player_screen.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({Key? key}) : super(key: key);

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  final TextStyle _titleTextStyle =
      const TextStyle(color: AllColors.blackColor, fontFamily: FontFamily.poppins, fontSize: 25, fontWeight: FontWeight.w800);
  final TextStyle _subtitleTextStyle =
      const TextStyle(color: AllColors.greyLightColor, fontFamily: FontFamily.raleway, fontSize: 15, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AllColors.blackColor,
            size: 30,
          ),
        ),
        title: const Center(
          child: Text(
            "Now Playing",
            style: TextStyle(
              fontSize: 20,
              color: AllColors.blackColor,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.poppins,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.more_horiz_rounded,
              color: AllColors.blackColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width * 0.60,
                // margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    color: const Color(0xfff9f6ec),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.asset(ImageAssets.musicDummy4, fit: BoxFit.cover)),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "Ekon Tui Kita Korte",
                style: _titleTextStyle,
              ),
              Text(
                "Andu Bendu",
                style: _subtitleTextStyle,
              )
            ],
          ),
          const Expanded(child: AudioPlayerScreen()),
        ],
      ),
    );
  }
}
