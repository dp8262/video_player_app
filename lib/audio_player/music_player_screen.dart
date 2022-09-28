
import 'package:flutter/material.dart';
import 'package:video_player_app/audio_player/now_playing_screen.dart';
import 'package:video_player_app/ui/common/constants.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final TextStyle _titleTextStyle =
      const TextStyle(color: AllColors.blackColor, fontFamily: FontFamily.poppins, fontSize: 16, fontWeight: FontWeight.w800);
  final TextStyle _subtitleTextStyle =
      const TextStyle(color: AllColors.greyLightColor, fontFamily: FontFamily.raleway, fontSize: 12, fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular This Week",
              style: TextStyle(fontFamily: FontFamily.raleway, color: AllColors.blackColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NowPlayingScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width * 0.50,
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
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), child: Image.asset(ImageAssets.musicDummy4, fit: BoxFit.cover)),
                              ),
                              const Positioned(
                                  bottom: 70,
                                  left: 15,
                                  child: Text(
                                    "Matio Na Beshi",
                                    style: TextStyle(
                                      color: AllColors.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: FontFamily.raleway,
                                    ),
                                  )),
                              Positioned(
                                bottom: 20,
                                left: 15,
                                child: Row(
                                  children: [
                                    Container(
                                        height: 40,
                                        width: 50,
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
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          size: 30,
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 100,
                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                            color: AllColors.purpalLightColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0, 1), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: const [
                                                Icon(
                                                  Icons.play_arrow,
                                                  size: 17,
                                                  color: AllColors.whiteColor,
                                                ),
                                                Text(
                                                  "243",
                                                  style: TextStyle(color: AllColors.whiteColor, fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            const VerticalDivider(
                                              color: AllColors.whiteColor,
                                              thickness: 1,
                                            ),
                                            Column(
                                              children: const [
                                                Icon(
                                                  Icons.download_rounded,
                                                  size: 17,
                                                  color: AllColors.whiteColor,
                                                ),
                                                Text(
                                                  "243",
                                                  style: TextStyle(color: AllColors.whiteColor, fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            const VerticalDivider(
                                              color: AllColors.whiteColor,
                                              thickness: 1,
                                            ),
                                            Column(
                                              children: const [
                                                Icon(
                                                  Icons.favorite,
                                                  size: 17,
                                                  color: AllColors.whiteColor,
                                                ),
                                                Text(
                                                  "193",
                                                  style: TextStyle(color: AllColors.whiteColor, fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Top Songs ",
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: 23,
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NowPlayingScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  ImageAssets.musicDummy1, height: MediaQuery.of(context).size.height * 0.070,
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  fit: BoxFit.fill,
                                  // height:MediaQuery.of(context).size.height * 0.16, width: MediaQuery.of(context).size.width* 0.35, boxFit: BoxFit.cover
                                )),
                            const Positioned(
                                top: 10,
                                bottom: 10,
                                left: 10,
                                right: 10,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AllColors.whiteColor,
                                  size: 30,
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Ekon tui kita korte",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: _titleTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("12,098 played", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                            ],
                          ),
                        ),
                        const Icon(Icons.more_horiz_rounded),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
