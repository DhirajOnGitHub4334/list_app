import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:list_app/Model/user_data_model.dart';
import 'package:list_app/Utils/common_code%20.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FlowScreen extends StatefulWidget {
  const FlowScreen({super.key});

  @override
  State<FlowScreen> createState() => _FlowScreenState();
}

class _FlowScreenState extends State<FlowScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as FlowData?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flow"),
      ),
      body: (args == null)
          ? Column(
              children: [
                Expanded(
                    child:
                        CommonTextStyle.commonData("No Flow Data Available."))
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
                    labels: ['Picture', 'Tags'],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        selectedIndex = index!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                selectedIndex == 0
                    ? (args.pictures == null)
                        ? Expanded(
                            child: CommonTextStyle.commonData(
                                "No Picture Data Available."))
                        : buildPictureWidget(args.pictures!)
                    : (args.tags == null)
                        ? Expanded(
                            child: CommonTextStyle.commonData(
                                "No Tags Data Available."))
                        : buildTagsWidget(args.tags!),
              ],
            ),
    );
  }

  Widget buildPictureWidget(List<Picture> picture) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: picture.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildRowWiget("Id : ", picture[index].id.toString()),
                    buildRowWiget("Caption : ", picture[index].caption),
                    buildRowWiget("Mime : ", picture[index].mime),
                    buildRowWiget("Name : ", picture[index].name),
                    buildRowWiget("url : ", picture[index].url),
                    // buildRowWiget("Tags : ", picture[index].Tags[index]),
                  ],
                ),
              ),
            ),
          );
        },
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

  Widget buildTagsWidget(List<String> tags) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tags!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      tags[index],
                      style: CommonTextStyle()
                          .boldBodyMedium(context, FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
