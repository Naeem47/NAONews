import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Constants/ColorPalate.dart';

class PVcont extends StatelessWidget {
  const PVcont({super.key,required this.text,required this.text2,required this.images});
  
  final String text;
  final String text2;
  final String images;

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.sizeOf(context).height*1;
  final width = MediaQuery.sizeOf(context).width*1;
    return SizedBox(
              height:height ,
              width: width,
              child: Padding(
    
                padding: const EdgeInsets.fromLTRB(8.0,30.0,8.0,8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
    
                    SizedBox(
                      height: height*0.4,
                      width: width,
                      child: Image.asset(images,fit: BoxFit.cover,),
                    ),
                                                     SizedBox(height: height*0.07,),

                     Text(
                text,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: ColorConstant.black,
                ),
                textAlign: TextAlign.center,
              ),
                                 SizedBox(height: height*0.1,),
                                     Text(
                text2.toUpperCase(),
                maxLines: 4,
                style: GoogleFonts.dmSans(

                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: ColorConstant.black,
                ),
                textAlign: TextAlign.center,
              ),
                   
                    
                  ],
                  
                ),
              ),
            );
  }
}