import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player_app/audio_player/audio_player_screen.dart';
import 'package:video_player_app/audio_player/tabBar_screen.dart';
import 'package:video_player_app/ui/discover_screen.dart';
import 'package:video_player_app/ui/tabbar_screen.dart';
import 'package:video_player_app/ui/video_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light
        // transparent status bar
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TabBarScreen(),
      home: const TabBarListScreen(),
    );
  }
}

