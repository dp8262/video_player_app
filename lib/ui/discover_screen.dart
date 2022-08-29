import 'package:flutter/material.dart';
import 'package:video_player_app/ui/person_list_of_video.dart';

import 'common/constants.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextStyle _titleTextStyle =
      const TextStyle(color: AllColors.whiteColor, fontFamily: FontFamily.poppins, fontSize: 14, fontWeight: FontWeight.w400);
  final TextStyle _subtitleTextStyle =
      const TextStyle(color: AllColors.greyLightColor, fontFamily: FontFamily.raleway, fontSize: 12, fontWeight: FontWeight.w300);
  final List<Map<String, dynamic>> _list = [
    {'name': 'Tony', "images": ImageAssets.person1},
    {'name': 'Thomas', "images": ImageAssets.person2},
    {'name': 'Budi', "images": ImageAssets.person3},
    {'name': 'johny', "images": ImageAssets.person4},
    {'name': 'Andy', "images": ImageAssets.personImages},
    {'name': 'Tony', "images": ImageAssets.person1},
    {'name': 'Thomas', "images": ImageAssets.person2},
    {'name': 'Budi', "images": ImageAssets.person3},
    {'name': 'johny', "images": ImageAssets.person4},
    {'name': 'Andy', "images": ImageAssets.personImages},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1d2c),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1f1d2c),
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Discover",
            style: TextStyle(fontFamily: FontFamily.raleway, color: AllColors.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _list.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PersonListOfScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          index == 0 || index == 1
                              ? Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.blueAccent,
                                      child: CircleAvatar(
                                        radius: 33,
                                        backgroundColor: Color(0xff1f1d2c),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(ImageAssets.personImages),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Image.asset(
                                          ImageAssets.rightIcon,
                                          scale: 2.5,
                                        ))
                                  ],
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(_list[index]["images"]),
                                ),
                          SizedBox(
                            height: index == 0 || index == 1 ? 5 : 15,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              _list[index]["name"],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: FontFamily.raleway, fontSize: 13, fontWeight: FontWeight.w400, color: AllColors.greyLightColor),
                            ),
                          )
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.80,
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
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(ImageAssets.dummyImage, fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Text(
                AllString.mostWatched,
                style: TextStyle(fontFamily: FontFamily.raleway, color: AllColors.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 5),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PersonListOfScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    ImageAssets.dummyImage4, height: MediaQuery.of(context).size.height * 0.15,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    // height:MediaQuery.of(context).size.height * 0.16, width: MediaQuery.of(context).size.width* 0.35, boxFit: BoxFit.cover
                                  )),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
                                width: MediaQuery.of(context).size.width * 0.60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Prepare for your first Skateboard jump",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: _titleTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Jordan wise", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("125,908 View", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text("2 days ago", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 5),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  ImageAssets.dummyImage6, height: MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  // height:MediaQuery.of(context).size.height * 0.16, width: MediaQuery.of(context).size.width* 0.35, boxFit: BoxFit.cover
                                )),
                            Container(
                              padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Prepare for your first Skateboard jump",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: _titleTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Jordan wise", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("125,908 View", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text("2 days ago", overflow: TextOverflow.ellipsis, maxLines: 1, style: _subtitleTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}
