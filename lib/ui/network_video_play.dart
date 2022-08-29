import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/ui/common/constants.dart';

class NetworkVideoPlayerWidget extends StatefulWidget {
  const NetworkVideoPlayerWidget({Key? key}) : super(key: key);

  @override
  NetworkVideoPlayerWidgetState createState() => NetworkVideoPlayerWidgetState();
}

class NetworkVideoPlayerWidgetState extends State<NetworkVideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLoading = false;
  late Widget videoStatusAnimation;

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
        final bool isLoading = _controller.value.isBuffering;
        if (_isLoading != _isLoading) {
          setState(() {
            _isLoading = isLoading;
          });
        }
      })
      ..initialize().then((_) {
        Timer(const Duration(milliseconds: 0), () {
          if (!mounted) return;

          setState(() {});
          _controller.play();
        });
      });
    _controller.setLooping(true);
    _controller.play();
  }

  // setLandScapeMode() {
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: _controller.value.isInitialized
            ? Scaffold(
                extendBodyBehindAppBar: true,
                body: Stack(
                  children: <Widget>[
                    video(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(backgroundColor: AllColors.greyLightColor, playedColor: AllColors.whiteColor),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                backgroundColor: Colors.yellowAccent,
                              )
                            : Container()),
                    Center(child: videoStatusAnimation),
                  ],
                ),
              )
            : Container(),
      );

  Widget video() => GestureDetector(
        child: VideoPlayer(
          _controller,
        ),
        onTap: () {
          if (!_controller.value.isInitialized) {
            return;
          }
          if (_controller.value.isPlaying) {
            videoStatusAnimation = const Icon(
              Icons.pause,
              size: 50.0,
              color: AllColors.whiteColor,
            );
            _controller.pause();
          } else {
            videoStatusAnimation = const FadeAnimation(
                child: Icon(
              Icons.play_arrow,
              size: 50.0,
              color: AllColors.whiteColor,
            ));
            _controller.play();
          }
        },
      );
}

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({Key? key, required this.child, this.duration = const Duration(milliseconds: 1000)}) : super(key: key);

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
