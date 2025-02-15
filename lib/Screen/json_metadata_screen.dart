import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:list_app/Screen/flow_screen.dart';
import 'package:list_app/Screen/video_screen.dart';
import 'package:list_app/Utils/common_code%20.dart';

import '../Model/user_data_model.dart';
import '../Widget/custome_button.dart';

class JsonMetaDataScreen extends StatefulWidget {
  const JsonMetaDataScreen({super.key});

  @override
  State<JsonMetaDataScreen> createState() => _JsonMetaDataScreenState();
}

class _JsonMetaDataScreenState extends State<JsonMetaDataScreen> {
  List<String> listOfImageUrl = [];
  List<String> listOfTags = [];
  List<String> listOfUser = [];
  List<String> listOfLinks = [];
  List<String> listOfImageRatios = [];
  List<String> listOfchoices = [];
  List<String> listOfimages = [];
  List<String> listOfThumbnails = [];

  int clickNum = 0;

  void clickOnImageUrl(List<String> imageUrlList) {
    for (String image in imageUrlList) {
      listOfImageUrl.add(image);
    }
    setState(() {
      clickNum = 1;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnTags(List<String> tagsList) {
    for (String tags in tagsList) {
      listOfTags.add(tags);
    }
    setState(() {
      clickNum = 2;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnUser(List<String> userList) {
    for (String user in userList) {
      listOfUser.add(user);
    }
    setState(() {
      clickNum = 3;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnLinks(List<String> linksList) {
    for (String link in linksList) {
      listOfLinks.add(link);
    }
    setState(() {
      clickNum = 4;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnImageRatios(List<String> imageRatios) {
    for (String ratios in imageRatios) {
      listOfImageRatios.add(ratios);
    }
    setState(() {
      clickNum = 5;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnChoices(List<String> choiceList) {
    for (String choice in choiceList) {
      listOfchoices.add(choice);
    }
    setState(() {
      clickNum = 6;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnImages(List<dynamic> images) {
    for (String img in images) {
      listOfimages.add(img);
    }
    setState(() {
      clickNum = 7;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnThumbnails(List<String> thumbNailsList) {
    for (String thumb in thumbNailsList) {
      listOfThumbnails.add(thumb);
    }
    setState(() {
      clickNum = 8;
    });
    log("Click On Link : $clickNum");
  }

  void clickOnVideo(Video? video) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VideoScreen(),
        settings: RouteSettings(arguments: video),
      ),
    );
  }

  void clickOnFlow(FlowData? flows) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FlowScreen(),
        settings: RouteSettings(arguments: flows),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as JsonMetadata?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Meta Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildRowWiget("App : ", args!.app),
                    buildRowWiget("Format : ", args.format),
                    buildRowWiget(
                        "Description : ", args.description.toString()),
                    buildRowWiget(
                        "Content Type  : ", args.contentType.toString()),
                    buildRowWiget("End Time  : ", args.endTime.toString()),
                    // buildRowWiget(
                    //     "Filter Account  : ", args.filters!.accountAge.toString()),
                    buildRowWiget("Preferred Interpretation  : ",
                        args.preferredInterpretation.toString()),
                    buildRowWiget("Question  : ", args.question.toString()),
                    buildRowWiget("Version  : ", args.version.toString()),
                    buildRowWiget(
                        "Canonical Url  : ", args.canonicalUrl.toString()),
                    buildRowWiget("Dimensions  : ", args.dimensions.toString()),
                    buildRowWiget("Type  : ", args.type!),
                    buildRowWiget("Community  : ", args.community.toString()),

                    CustomButtonWidgrt(
                        onTap: () => clickOnImageUrl(args.image!),
                        onTap2: () => clickOnTags(args.tags),
                        btnName: "Image Url",
                        btnSecond: "Tags"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnUser(args.users!),
                        onTap2: () => clickOnLinks(args.links!),
                        btnName: "Users",
                        btnSecond: "Links"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnImageRatios(args.imageRatios!),
                        onTap2: () => clickOnChoices(args.choices!),
                        btnName: "Image Ratios",
                        btnSecond: "Choices"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnImages(args.images!),
                        onTap2: () => clickOnThumbnails(args.thumbnails!),
                        btnName: "Images",
                        btnSecond: "Thumbnails"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnVideo(args.video),
                        onTap2: () => clickOnFlow(args.flow!),
                        btnName: "Video",
                        btnSecond: "Flow"),
                  ],
                ),
              ),
            ),
          ),
          if (clickNum == 1 && listOfImageUrl.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No Image url Exist."),
            ),
          if ((clickNum == 2 && listOfTags.isEmpty))
            Expanded(
              child: CommonTextStyle.commonData("No List Tags Exist."),
            ),
          if (clickNum == 3 && listOfUser.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No User list Exist."),
            ),
          if (clickNum == 4 && listOfLinks.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No Link list Exist."),
            ),
          if ((clickNum == 5 && listOfImageRatios.isEmpty))
            Expanded(
              child: CommonTextStyle.commonData("No Image Ratios Exist."),
            ),
          if (clickNum == 6 && listOfchoices.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No Choice List Exist."),
            ),
          if (clickNum == 7 && listOfimages.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No Images List Exist."),
            ),
          if (clickNum == 8 && listOfThumbnails.isEmpty)
            Expanded(
              child: CommonTextStyle.commonData("No ThumbNails Exist."),
            ),
          (clickNum == 0)
              ? Expanded(
                  child: CommonTextStyle.commonData(
                      "First Select One Type Of Above."),
                )
              : Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: (clickNum == 1)
                          ? listOfImageUrl.length
                          : (clickNum == 2)
                              ? listOfTags.length
                              : (clickNum == 3)
                                  ? listOfUser.length
                                  : (clickNum == 4)
                                      ? listOfLinks.length
                                      : (clickNum == 5)
                                          ? listOfImageRatios.length
                                          : (clickNum == 6)
                                              ? listOfchoices.length
                                              : (clickNum == 7)
                                                  ? listOfimages.length
                                                  : listOfThumbnails.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (clickNum == 1)
                                    ? listOfImageUrl[index]
                                        .characters
                                        .toString()
                                    : (clickNum == 2)
                                        ? listOfTags[index]
                                            .characters
                                            .toString()
                                        : (clickNum == 3)
                                            ? listOfUser[index]
                                                .characters
                                                .toString()
                                            : (clickNum == 4)
                                                ? listOfLinks[index]
                                                    .characters
                                                    .toString()
                                                : (clickNum == 5)
                                                    ? listOfImageRatios[index]
                                                        .characters
                                                        .toString()
                                                    : (clickNum == 6)
                                                        ? listOfchoices[index]
                                                            .characters
                                                            .toString()
                                                        : (clickNum == 7)
                                                            ? listOfimages[
                                                                    index]
                                                                .characters
                                                                .toString()
                                                            : listOfThumbnails[
                                                                    index]
                                                                .characters
                                                                .toString(),
                                style: CommonTextStyle()
                                    .boldBodyMedium(context, FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildRowWiget(String firstName, String first) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 50,
          child: Text(
            firstName,
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              first,
              style: CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
