import 'package:flutter/material.dart';
import 'package:list_app/Screen/beneficiary_list_screen.dart';
import 'package:list_app/Screen/replies_list_screen.dart';
import 'package:list_app/Screen/stats_data_screen.dart';

import '../Model/user_data_model.dart';
import '../Utils/common_code .dart';
import '../Widget/custome_button.dart';
import '../Widget/user_list_widget.dart';
import 'active_voter_list_screen.dart';
import 'black_list_screen.dart';
import 'json_metadata_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  Result? args;

  @override
  void initState() {
    super.initState();
  }

  void clickOnJsonMetaData(JsonMetadata jsonMetaData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const JsonMetaDataScreen(),
        settings: RouteSettings(arguments: jsonMetaData),
      ),
    );
  }

  void clickOnStatsData(Stats stats) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StatsDataScreen(),
        settings: RouteSettings(arguments: stats),
      ),
    );
  }

  void clickOnActiveVoter(List<ActiveVote> voterList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ActiveVoterListScreen(),
        settings: RouteSettings(arguments: voterList),
      ),
    );
  }

  void clickOnBeneficiaryList(List<Beneficiary> beneficiaryList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BeneficiaryListScreen(),
        settings: RouteSettings(arguments: beneficiaryList),
      ),
    );
  }

  void clickOnBlackList(List<dynamic> blackList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BlackListScreen(),
        settings: RouteSettings(arguments: blackList),
      ),
    );
  }

  void clickOnRepliesList(List<dynamic> repliesList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RepliesListScreen(),
        settings: RouteSettings(arguments: repliesList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as Result;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              surfaceTintColor: Colors.white,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildWidgetForRow(context, "Author Role : ",
                        secondName: args!.authorRole.toString()),
                    buildWidgetForRow(context, "Author : ",
                        secondName: args!.author),
                    buildWidgetForRow(context, "Author Payout Value : ",
                        secondName: args!.authorPayoutValue),
                    buildWidgetForRow(context, "Author Reputation : ",
                        secondName: args!.authorReputation.toString()),
                    buildWidgetForRow(context, "Author Title : ",
                        secondName: args!.authorTitle.toString()),
                    buildWidgetForRow(context, "Category : ",
                        secondName: args!.category),
                    buildWidgetForRow(context, "Children : ",
                        secondName: args!.children.toString()),
                    buildWidgetForRow(context, "Community : ",
                        secondName: args!.community.toString()),
                    buildWidgetForRow(context, "Community Title : ",
                        secondName: args!.communityTitle.toString()),
                    buildWidgetForRow(context, "Created : ",
                        secondName: args!.created),
                    buildWidgetForRow(context, "Curator Payout Value : ",
                        secondName: args!.curatorPayoutValue),
                    buildWidgetForRow(context, "Depth : ",
                        secondName: args!.depth.toString()),
                    buildWidgetForRow(context, "Max Accepted Payout : ",
                        secondName: args!.maxAcceptedPayout),
                    buildWidgetForRow(context, "Net R shares : ",
                        secondName: args!.netRshares.toString()),
                    buildWidgetForRow(context, "Payout : ",
                        secondName: args!.payout.toString()),
                    buildWidgetForRow(context, "Payout At : ",
                        secondName: args!.payoutAt),
                    buildWidgetForRow(context, "Pending Payout Value : ",
                        secondName: args!.pendingPayoutValue),
                    buildWidgetForRow(context, "Percent Hbd : ",
                        secondName: args!.percentHbd.toString()),
                    buildWidgetForRow(context, "Perm Link : ",
                        secondName: args!.permlink),
                    buildWidgetForRow(context, "Post Id : ",
                        secondName: args!.postId.toString()),
                    buildWidgetForRow(context, "Promoted : ",
                        secondName: args!.promoted),
                    buildWidgetForRow(context, "Re-Blogs : ",
                        secondName: args!.reblogs.toString()),
                    buildWidgetForRow(context, "Title : ",
                        secondName: args!.title),
                    buildWidgetForRow(context, "Url : ", secondName: args!.url),
                    buildWidgetForRow(context, "Updated : ",
                        secondName: args!.updated),
                    const SizedBox(height: 20),
                    CustomButtonWidgrt(
                        onTap: () => clickOnJsonMetaData(args!.jsonMetadata),
                        onTap2: () => clickOnStatsData(args!.stats),
                        btnName: "Extra Json Meta Data",
                        btnSecond: "Stats Data"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnStatsData(args!.stats),
                        onTap2: () => clickOnActiveVoter(args!.activeVotes),
                        btnName: "Active Voter List",
                        btnSecond: "Beneficiary List"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnActiveVoter(args!.activeVotes),
                        onTap2: () =>
                            clickOnBeneficiaryList(args!.beneficiaries),
                        btnName: "Active Voter List",
                        btnSecond: "Beneficiary List"),
                    CustomButtonWidgrt(
                        onTap: () => clickOnBlackList(args!.blacklists),
                        onTap2: () => clickOnRepliesList(args!.replies),
                        btnName: "Black List",
                        btnSecond: "Replies List"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonTextButton(Function() onTap, String label) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.blue, fontSize: 22),
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
            secondName!.toUpperCase() ?? "NA",
            textAlign: TextAlign.end,
            maxLines: secondName!.length <= 20 ? 2 : 10,
            overflow: TextOverflow.ellipsis,
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
