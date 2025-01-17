import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:list_app/Model/user_data_model.dart';
import 'package:list_app/Utils/common_code%20.dart';
import 'package:toggle_switch/toggle_switch.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Video?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
      ),
      body: (args == null)
          ? Column(
              children: [
                Expanded(
                  child: CommonTextStyle.commonData("No Video Data"),
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ToggleSwitch(
                    minWidth: double.infinity,
                    cornerRadius: 10.0,
                    activeBgColors: [
                      [Colors.green[800]!],
                      [Colors.red[800]!]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: selectedIndex,
                    totalSwitches: 2,
                    labels: ['Content', 'Info'],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        selectedIndex = index!;
                      });
                    },
                  ),
                ),
                (selectedIndex == 0)
                    ? buildContentWidget(args!.content!.tags)
                    : buildInfoWidget(args!.info),
              ],
            ),
    );
  }

  Widget buildInfoWidget(Info? info) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  buildRowWidget("Author : ", info!.author),
                  buildRowWidget("Duration : ", info.duration.toString()),
                  buildRowWidget("File : ", info.file),
                  buildRowWidget("File Size : ", info.filesize.toString()),
                  buildRowWidget("IPFS : ", info.ipfs.toString()),
                  buildRowWidget(
                      "ipfs Thumbnail : ", info.ipfsThumbnail.toString()),
                  buildRowWidget("Lang : ", info.lang),
                  buildRowWidget("Perm Link : ", info.permlink),
                  buildRowWidget("Plat form : ", info.platform),
                  buildRowWidget("Title : ", info.title),
                  buildRowWidget("Video V2 : ", info.videoV2),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: info.sourceMap.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              buildRowWidget(
                                  "Format", info.sourceMap[index].format!),
                              buildRowWidget(
                                  "Type", info.sourceMap[index].type),
                              buildRowWidget("Url", info.sourceMap[index].url),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowWidget(String first, String second) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            first,
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
          ),
        ),
        Expanded(
          flex: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              second,
              style: CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContentWidget(List<String>? args) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description :",
                  style: CommonTextStyle()
                      .boldBodyMedium(context, FontWeight.bold),
                ),
                Text(
                  "args.description!",
                  style: CommonTextStyle()
                      .boldBodyMedium(context, FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: args!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        args[index],
                        style: CommonTextStyle()
                            .boldBodyMedium(context, FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
