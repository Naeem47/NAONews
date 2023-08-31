// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/Service/Authservice.dart';
import 'package:news/View/Categoryview.dart';
import 'package:news/View/DetailView.dart';
import 'package:news/ViewModel/newsrepoviewmodel.dart';
import 'package:intl/intl.dart';
import 'package:news/widgets/newstile.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final format = DateFormat('MM/dd/yyyy');

  @override
  Widget build(BuildContext context) {
    final NewsRepoViewModel newsRepoViewModel = NewsRepoViewModel();
    final AuthService authService = AuthService();
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                authService.logout(context);
              },
              icon: const Icon(FontAwesomeIcons.signOut))
        ],
        centerTitle: true,
        title: Text(
          "ℕ₳Ø News",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: ColorConstant.black,
          ),
          textAlign: TextAlign.center,
        ),
        leading: CircleAvatar(
          // radius: 30,
          backgroundColor:Colors.white,
          child: LottieBuilder.asset("assets/lotties/login.json"),
        ),
      ),
      body: SizedBox(
        // height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey, ${FirebaseAuth.instance.currentUser!.displayName}",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.black,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                SizedBox(
                  height: height * 0.27,
                  // width: width,
                  child: FutureBuilder(
                    future: newsRepoViewModel.fetchheadlineus(),
                    builder: (context, snapshot) => CarouselSlider.builder(
                    
                    
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index, realIndex) {
                        DateTime? dateTime =
                            snapshot.data!.articles![index].publishedAt != null
                                ? DateTime.parse(snapshot
                                    .data!.articles![index].publishedAt
                                    .toString())
                                : null;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: LottieBuilder.asset(
                                  "assets/lotties/loader.json")); // Show a loading indicator while waiting
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('OOPs!: ${snapshot.error}'));
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('No data available'));
                        }
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailView(
                                        url:
                                            "${snapshot.data!.articles![index].url}",
                                        date: "${format.format(dateTime!)} ",
                                        imageurl: snapshot
                                            .data!.articles![index].urlToImage,
                                        source:
                                            "${snapshot.data!.articles![index].source!.name}",
                                        title:
                                            "${snapshot.data!.articles![index].title}",
                                        description:
                                            "${snapshot.data!.articles![index].content}",
                                      ),
                                    ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.25,
                                  width: width / 1.12,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data!.articles![index]
                                                .urlToImage ??
                                            "https://previews.123rf.com/images/vitmann/vitmann1907/vitmann190700017/128201795-vector-symbol-of-word-error-in-glitch-style-geometric-letters-glitched-icon-isolated-on-white.jpg",
                                        fit: BoxFit.fitWidth,
                                        placeholder: (context, url) =>
                                            LottieBuilder.asset(
                                                "assets/lotties/loader.json"),
                                      )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  // right: ,
                                  // left: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      height: height * 0.12,
                                      width: width / 1.18,
                                      decoration: BoxDecoration(
                                        color:
                                            ColorConstant.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorConstant.white.withOpacity(0.2),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot.data!.articles![index]
                                                    .title ??
                                                "N/A",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                GoogleFonts.dmSans(fontSize: 20,color: ColorConstant.black),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot.data!.articles![index]
                                                        .source!.name ??
                                                    "N/A",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 12,color: ColorConstant.black),
                                              ),
                                              Text(
                                                dateTime != null
                                                    ? format.format(dateTime)
                                                    : "",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 12,color: ColorConstant.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                  options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction:1.0,
                  // height: MediaQuery.of(context).size.height * 0.400,
                  pageSnapping: true,
                  // enlargeCenterPage: true,

                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
                    ),
                 
                  ),
                ),

                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filter by catgories",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.black,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CategoryView(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: ColorConstant.black,
                            ))
                      ],
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  "Top Headlines",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.black,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),

                FutureBuilder(
                    future: newsRepoViewModel.fetchheadline(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: LottieBuilder.asset(
                                "assets/lotties/loader.json")); // Show a loading indicator while waiting
                      } else if (snapshot.hasError) {
                        return Center(child: Text('OOPs!: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text('No data available'));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailView(
                                        url:
                                            "${snapshot.data!.articles![index].url}",
                                        date: "${format.format(dateTime)} ",
                                        imageurl: snapshot
                                            .data!.articles![index].urlToImage,
                                        source:
                                            "${snapshot.data!.articles![index].source!.name}",
                                        title:
                                            "${snapshot.data!.articles![index].title}",
                                        description:
                                            "${snapshot.data!.articles![index].content}",
                                      ),
                                    )),
                                child: NewsTile(
                                  date: "${format.format(dateTime)} ",
                                  imageurl: snapshot
                                      .data!.articles![index].urlToImage,
                                  source:
                                      "${snapshot.data!.articles![index].source!.name}",
                                  title:
                                      "${snapshot.data!.articles![index].title}",
                                )),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
