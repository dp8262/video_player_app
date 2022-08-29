import 'package:flutter/material.dart';

import 'common/constants.dart';
import 'file_video_play.dart';
import 'network_video_play.dart';

class PersonListOfScreen extends StatefulWidget {
  const PersonListOfScreen({Key? key}) : super(key: key);

  @override
  State<PersonListOfScreen> createState() => _PersonListOfScreenState();
}

class _PersonListOfScreenState extends State<PersonListOfScreen> {
  final TextStyle _titleTextStyle =
      const TextStyle(color: AllColors.whiteColor, fontFamily: FontFamily.poppins, fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle _subtitleTextStyle =
      const TextStyle(color:Color(0xff90939d), fontFamily: FontFamily.raleway, fontSize: 15, fontWeight: FontWeight.w400);
  final OutlineInputBorder _border =
      OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1d2c),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xff1f1d2c),
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AllColors.greyLightColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(ImageAssets.personImages),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(backgroundColor: Colors.blueAccent, radius: 10, child: Image.asset(ImageAssets.rightIcon)))
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Andy William",
                      style: _titleTextStyle,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 3,
                    )
                  ],
                ),
                Text(
                  "1,980,893 subscribers",
                  style: _subtitleTextStyle,
                )
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.favorite,
                size: 20,
                color: AllColors.whiteColor,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: const Color(0xff262837),
              ),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.90,
                      //  padding: const EdgeInsets.only(left: 3,right: 3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color(0xff262837),
                      ),
                      child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: NetworkVideoPlayerWidget())),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            "2.45 / 20.53",
                            style:
                                TextStyle(color: AllColors.greyLightColor, fontFamily: FontFamily.raleway, fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Icon(
                          Icons.volume_up,
                          color: AllColors.greyLightColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FileVideoPlay()),
                              );
                            },
                            child: const Icon(Icons.zoom_out_map, color: AllColors.greyLightColor))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                "How to ride your skateboard and Basic Equipment",
                style: TextStyle(color: AllColors.whiteColor, fontFamily: FontFamily.poppins, fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye_rounded,
                    size: 20,
                    color: AllColors.greyLightColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "125,908  View",
                    style: _subtitleTextStyle,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.favorite,
                    size: 20,
                    color: AllColors.greyLightColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "47987  likes",
                    style: _subtitleTextStyle,
                  )
                ],
              ),
            ),
            const Divider(
              color: AllColors.greyLightColor,
              thickness: 0.10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AllColors.blackColor,
                            backgroundImage: AssetImage(ImageAssets.personImages),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(backgroundColor: Colors.blueAccent, radius: 10, child: Image.asset(ImageAssets.rightIcon)))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.68,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: const Color(0xff262837),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Wijaya Abadi",
                                  style: _titleTextStyle,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.greenAccent,
                                  radius: 5,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Duis aute irure dolor in in proident velit esse cillum dolore eu fugiat",
                              maxLines: 3,
                              style: _subtitleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AllColors.blackColor,
                            backgroundImage: AssetImage(ImageAssets.personImages),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(backgroundColor: Colors.blueAccent, radius: 10, child: Image.asset(ImageAssets.rightIcon)))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.60,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: const Color(0xff262837),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Johny Wise",
                                  style: _titleTextStyle,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.redAccent,
                                  radius: 5,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "tempor incididunt ut labore",
                              style: _subtitleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: const Color(0xff262837), borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                cursorColor: AllColors.greyLightColor,
                style: const TextStyle(color: AllColors.greyLightColor, fontWeight: FontWeight.w400, fontSize: 14),
                decoration: InputDecoration(
                    hintText: "Write your message",
                    hintStyle: const TextStyle(color: AllColors.greyLightColor, fontWeight: FontWeight.w400, fontSize: 15),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CircleAvatar(
                          backgroundColor: AllColors.blueLightColor,
                          radius: 15,
                          child: Icon(
                            Icons.send,
                            color: AllColors.greyLightColor,
                          )),
                    ),
                    icon: const CircleAvatar(
                      radius: 15,
                      backgroundColor: AllColors.greyLightColor,
                      child: Icon(
                        Icons.more_horiz,
                        color: AllColors.blackColor,
                      ),
                    ),
                    border: _border,
                    focusedBorder: _border,
                    disabledBorder: _border,
                    enabledBorder: _border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
