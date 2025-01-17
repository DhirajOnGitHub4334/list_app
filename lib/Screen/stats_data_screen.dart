import 'package:flutter/material.dart';
import 'package:list_app/Model/user_data_model.dart';
import 'package:list_app/Utils/common_code%20.dart';

class StatsDataScreen extends StatefulWidget {
  const StatsDataScreen({super.key});

  @override
  State<StatsDataScreen> createState() => _StatsDataScreenState();
}

class _StatsDataScreenState extends State<StatsDataScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Stats?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats Data"),
      ),
      body: args == null
          ? Column(
              children: [
                Expanded(
                  child: CommonTextStyle.commonData("No Stats Data Found."),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildWidgetForRow(context, "Flag Weight : ",
                      secondName: args.flagWeight.toString()),
                  buildWidgetForRow(context, "Total Votes :",
                      secondName: args.totalVotes.toString()),
                ],
              ),
            ),
    );
  }

  Widget buildWidgetForRow(BuildContext context, String firstName,
      {String? secondName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 40,
          child: Text(
            firstName.toUpperCase(),
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 60,
          child: Text(
            secondName!.toUpperCase(),
            textAlign: TextAlign.end,
            maxLines: secondName.length <= 20 ? 2 : 10,
            overflow: TextOverflow.ellipsis,
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
