import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/Service/Authservice.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
  final AuthService authService = AuthService();
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  RichText(
                    text: TextSpan(
                      text: ' Login to ',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.black,
                          fontSize: 30),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ℕ₳Ø News !',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.grey,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  SizedBox(
                      height: height * 0.5,
                      child: LottieBuilder.asset("assets/lotties/login.json")),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                            "Login with ",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.black,
                            ),
                          ),
                    ],
                  ),
                       SizedBox(
                    height: height * 0.03,
                  ),
                                        Divider(color: ColorConstant.grey,height: 2,thickness: 0.9),

 SizedBox(
                    height: height * 0.04,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                     FontAwesomeIcons.google,
                      color: ColorConstant.white,
                    ),
                    onPressed: () async{
                     await authService.handleGoogleLogin(context);
                     
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width, height * 0.05),
                      backgroundColor: ColorConstant.black,
                    ),
                    label: Text(
                      "Login with Google",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
