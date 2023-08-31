import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/View/LoginView.dart';
import 'package:news/View/SplashView.dart';
import 'package:news/View/onboarding.dart';
import 'package:news/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final showhome =  prefs.getBool('home') ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp( MyApp(showHome: showhome,));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key,required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: showHome?const SplashView():const Onboarding(),
    );
  }
}
