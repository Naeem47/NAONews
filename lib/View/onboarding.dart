import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/View/LoginView.dart';
import 'package:news/widgets/pageviewscreen2.dart';
import 'package:news/widgets/pageviewscreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

final cntroller = PageController();

List images = [
  "assets/images/ob3.png",
  "assets/images/ob2.png",
  "assets/images/ob1.png",
];
class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: cntroller,
          reverse: false,
          children: [
            PVcont(
              text: "Stay Updated",
              images: images[0],
              text2: "Stay updated with our app to see wat going around the world",
            ),
            PVcont(
              text: "Tap on the Tile",
              images: images[1],
              text2: "Tap on the news tile to expand the details and see more about the news",
            ),
            PVcont2(
              text: "Find Categorically",
              images: images[2],
              text2: "You can search news categorically in our app in a category tab ",
            ),
          ],
        ),
        bottomSheet: Container(
          height: height * 0.08,
          width: width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('home', true);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ));
                    },
                    child: Text(
                      "Skip",
                      style:
                          TextStyle(color: ColorConstant.black, fontSize: 15),
                    )),
                SmoothPageIndicator(
                  effect: WormEffect(
                      dotColor: ColorConstant.black,
                      dotHeight: height * 0.01,
                      dotWidth: width * 0.07,
                      activeDotColor: ColorConstant.grey),
                  controller: cntroller,
                  count: 3,
                  onDotClicked: (index) => cntroller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
                ),
                GestureDetector(
                  onTap: () {
                    cntroller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorConstant.black,
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorConstant.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
