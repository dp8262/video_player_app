import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/ui/common/constants.dart';

class FileVideoPlay extends StatefulWidget {
  const FileVideoPlay({Key? key}) : super(key: key);

  @override
  FileVideoPlayState createState() => FileVideoPlayState();
}

class FileVideoPlayState extends State<FileVideoPlay> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  late Future<void> _initializeVideoPlayerFuture;

  late Widget videoStatusAnimation;
  double _setVolumeValue = 0;

  bool _isLock = false;

  @override
  void initState() {
    super.initState();
    videoStatusAnimation = Container();
    _controller = VideoPlayerController.network("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
        // _controller.setVolume(2.0);
      })
      ..initialize().then((_) {
        Timer(const Duration(milliseconds: 500), () {
          if (!mounted) return;

          setState(() {});
          _controller.pause();
        });
      });
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.play();
    _controller.setLooping(true);
    setLandScapeMode();
    _controller.setVolume(1.0);
  }

  setLandScapeMode() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  bool isWakeEnable = true;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 16 / 9,
        child: _controller.value.isInitialized
            ? Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      InkWell(
                          onTap: () {
                            print("tap");
                            _isLock = !_isLock;

                            setState(() {});
                          },
                          child: _isLock
                              ? const Icon(Icons.lock_open, color: AllColors.greyLightColor, size: 40)
                              : const Icon(Icons.lock, color: AllColors.whiteColor, size: 40)),
                    ],
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  body: Stack(
                    children: <Widget>[
                      GestureDetector(
                        child: VideoPlayer(_controller),
                        onTap: () {
                          if (!_controller.value.isInitialized) {
                            return;
                          }
                          if (_controller.value.isPlaying) {
                            videoStatusAnimation = const FadeAnimation(
                                child: Icon(
                              Icons.pause,
                              size: 50.0,
                              color: Colors.white,
                            ));
                            _controller.pause();
                          } else {
                            videoStatusAnimation = const FadeAnimation(
                                child: Icon(
                              Icons.play_arrow,
                              size: 50.0,
                              color: Colors.white,
                            ));
                            _controller.play();
                          }
                        },
                      ),
                      Visibility(
                        visible: _isLock,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(backgroundColor: AllColors.greyLightColor, playedColor: AllColors.whiteColor),
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    color: Colors.transparent,
                                    onPressed: () {
                                      Duration currentPosition = _controller.value.position;
                                      Duration targetPosition = currentPosition + const Duration(seconds: -10);

                                      _controller.seekTo(targetPosition);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 40)),
                                IconButton(
                                    color: Colors.transparent,
                                    onPressed: () {
                                      Duration currentPosition = _controller.value.position;
                                      Duration targetPosition = currentPosition + const Duration(seconds: 10);

                                      _controller.seekTo(targetPosition);
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 40)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(child: videoStatusAnimation),
                      Positioned(
                        bottom: 50,
                        top: 50,
                        left: 0,
                        child: Visibility(
                          visible: _isLock,
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Slider(
                              min: 0,
                              max: 1,
                              activeColor: AllColors.whiteColor,
                              inactiveColor: AllColors.greyLightColor,
                              onChanged: (double value) {
                                _setVolumeValue = value;
                                _controller.setVolume(_setVolumeValue);
                                setState(() {});
                              },
                              value: _setVolumeValue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      );
}

class FadeAnimation extends StatefulWidget {
  const FadeAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(
        milliseconds: 1000,
      )})
      : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: widget.duration, vsync: this);
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: 0.0);
  }

  @override
  void deactivate() {
    animationController.stop();
    super.deactivate();
  }

  @override
  void didUpdateWidget(FadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => animationController.isAnimating
      ? Opacity(
          opacity: 1.0 - animationController.value,
          child: widget.child,
        )
      : Container();
}
