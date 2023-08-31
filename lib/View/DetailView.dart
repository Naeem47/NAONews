// ignore: file_names
// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  const DetailView(
      {super.key,
      required this.description,
      required this.imageurl,
      required this.url,
      required this.source,
      required this.date,
      required this.title});
  final imageurl;
  final String url;
  final String title;
  final String date;
  final String source;
  final String description;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(source,
           style: GoogleFonts.roboto(
                                  // fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                ),
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: ColorConstant.black,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                    "$date",
                    
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                          Text(
                                    source,
                    
                                    style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                               
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.04,) ,   
                       Text(
                                  title,
                    
                                  style: GoogleFonts.roboto(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                  SizedBox(height: height*0.04,) , 
                  Container(
                    height: height*0.26,
                    width: width,
                   decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageurl,
                      
                    ),
                    fit: BoxFit.cover,
                    
                  ),
                  shape: BoxShape.rectangle,),
                  ),  
                  SizedBox(height: height*0.04,) ,   
                          Text(
                                  description,
                                  
                    
                                  style: GoogleFonts.dmSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),     
                                 SizedBox(height: height*0.01,) ,   
                                  Divider(
                                thickness: 0.2,
                                color: ColorConstant.black,
                              ),
                                 SizedBox(height: height*0.01,) ,   
                          GestureDetector(
                            onTap: ()async{
                              final String _urlL = url;

                              await launch(_urlL );
                            },
                            child: RichText(
                                text: TextSpan(
                                  
                                  text: 'Read full article here : ',
                                      style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: ColorConstant.black,),
                                  children: <TextSpan>[
                                   
                                    TextSpan(
                                      text: '$url ',
                                      style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color:ColorConstant.grey),
                                    ),
                                   
                                  ],
                                ),
                              ),
                          ),  
                                     SizedBox(height: height*0.02,) ,   

                ],
              ),
            ),
          ),
        )
  

        );
  }
}
