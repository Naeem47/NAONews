// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/Service/userpresistance.dart';
import 'package:news/View/LoginView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  const Authpage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ℕ₳Ø News",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: ColorConstant.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * .20,
            ),
             SizedBox(height: height*.10,
             child: LottieBuilder.asset("assets/lotties/loader.json"),
             ),
          ],
        ),
      ),
    );
  }
}
