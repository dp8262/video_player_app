import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'file_video_play.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  ImagePicker imagePicker = ImagePicker();
  bool videoAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DottedBorder(
              color: Colors.black,
              strokeWidth: 2,
              dashPattern: const [2, 4, 2, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  height: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickVideoPlay();
                        },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: const Icon(Icons.upload, color: Colors.red, size: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Upload a video",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ))),
            ),
          ],
        ),
      ),
    );
  }

  late PickedFile videoFile;

  pickVideoPlay() async {
    try {
      final video = await imagePicker.getVideo(source: ImageSource.gallery);
      if (video != null) {
        videoFile = video;
        videoAdded = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FileVideoPlay()),
        );
        setState(() {});
      }
    } catch (ex) {
      print("picking video:==" + ex.toString());
    }
  }
}
