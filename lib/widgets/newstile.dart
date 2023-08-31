import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Constants/ColorPalate.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
      required this.date,
      required this.imageurl,
      required this.source,
      required this.title});
  final imageurl;
  final String title;
  final String source;
  final String date;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
         color:
                                          ColorConstant.white.withOpacity(0.2),
                                      // borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.white.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        ),
                                      ],
        // color: Colors.grey,
      ),
      height: height * 0.12,
      width: width,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
                                             
            ),
            width: width * 0.34,
            height: height * 0.12,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                  fit: BoxFit.fitHeight,

                  placeholder: (context, url) =>
                      LottieBuilder.asset("assets/lotties/loader.json"),
                )),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Expanded(
              flex: 2,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width*0.3,
                          child: Text(
                            source,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
