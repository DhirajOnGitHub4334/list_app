import 'package:flutter/material.dart';

import '../Model/user_data_model.dart';
import '../Utils/common_code .dart';
import '../Widget/user_list_widget.dart';

class ActiveVoterListScreen extends StatefulWidget {
  const ActiveVoterListScreen({super.key});

  @override
  State<ActiveVoterListScreen> createState() => _ActiveVoterListScreenState();
}

class _ActiveVoterListScreenState extends State<ActiveVoterListScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as List<ActiveVote>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Active Voter"),
      ),
      body: (args.isEmpty)
          ? CommonTextStyle.commonData("No Active User yet")
          : ListView.builder(
              itemCount: args.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ActiveVotesWidget(
                    reshares: args[index].rshares,
                    voter: args[index].voter,
                  ),
                );
              },
            ),
    );
  }
}
