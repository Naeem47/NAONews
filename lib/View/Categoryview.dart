import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Constants/ColorPalate.dart';
import 'package:news/View/DetailView.dart';
import 'package:news/ViewModel/newsrepoviewmodel.dart';
import 'package:news/widgets/newstile.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String selected = 'Business';
  final format = DateFormat('MM/dd/yyyy');
  final String dateee = "2023-08-28T14:00:58Z";

  List catgeory = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  final NewsRepoViewModel newsRepoViewModel = NewsRepoViewModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selected),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catgeory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          selected = catgeory[index];
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.002,
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          decoration: BoxDecoration(
                              color: selected == catgeory[index]
                                  ? ColorConstant.grey
                                  : ColorConstant.black,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            catgeory[index],
                            style:
                                GoogleFonts.roboto(color: ColorConstant.white),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: FutureBuilder(
                    future: newsRepoViewModel.fetchCategoryNews(selected),
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
                        itemBuilder: (BuildContext context, int index) {
                          DateTime? dateTime =
                              snapshot.data!.articles![index].publishedAt !=
                                      null
                                  ? DateTime.parse(snapshot
                                      .data!.articles![index].publishedAt
                                      .toString())
                                  : null;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailView(
                                  url: snapshot.data!.articles![index].url ??
                                      "N/A",
                                  date: dateTime != null
                                      ? format.format(dateTime)
                                      : format.format(DateTime.parse(dateee)),
                                  imageurl: snapshot
                                          .data!.articles![index].urlToImage ??
                                      "https://previews.123rf.com/images/vitmann/vitmann1907/vitmann190700017/128201795-vector-symbol-of-word-error-in-glitch-style-geometric-letters-glitched-icon-isolated-on-white.jpg",
                                  source: snapshot.data!.articles![index].source
                                          ?.name ??
                                      "N/A",
                                  title:
                                      snapshot.data!.articles![index].title ??
                                          "N/A",
                                  description:
                                      snapshot.data!.articles![index].content ??
                                          "N/A",
                                ),
                              )),
                              child: NewsTile(
                                date: dateTime != null
                                    ? format.format(dateTime)
                                    : "N/A",
                                imageurl: snapshot
                                        .data!.articles![index].urlToImage ??
                                    "https://previews.123rf.com/images/vitmann/vitmann1907/vitmann190700017/128201795-vector-symbol-of-word-error-in-glitch-style-geometric-letters-glitched-icon-isolated-on-white.jpg",
                                source: snapshot
                                        .data!.articles![index].source?.name ??
                                    "N/A",
                                title: snapshot.data!.articles![index].title ??
                                    "N/A",
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
