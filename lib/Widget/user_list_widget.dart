import 'package:flutter/material.dart';

import '../Utils/common_code .dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.author,
    required this.authorPayoutValue,
    required this.authorReputation,
    required this.authorRole,
    required this.authorTitle,
    required this.created,
    required this.title,
    required this.onTap,
  });

  final String author;
  final String authorPayoutValue;
  final double authorReputation;
  final String authorRole;
  final String authorTitle;
  final String created;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: (authorRole.isEmpty)
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: (authorRole == "admin")
                            ? Colors.green
                            : (authorRole == "guest")
                                ? Colors.blue
                                : (authorRole == "mod")
                                    ? Colors.yellow
                                    : Colors.red,
                      ),
                      child: Text(
                        authorRole,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
            ),
            buildRowWidget(context, "Author", "Title", author, title),
            buildRowWidget(context, "Author Payout Value", "Reputaion",
                authorPayoutValue, authorReputation.toString()),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                created,
                style:
                    CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.send, size: 32, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowWidget(BuildContext context, String name, String name2,
      String firstName, String secondName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 50,
          child: RichText(
            text: TextSpan(
              text: "$name : ",
              style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
              children: [
                TextSpan(
                  text: firstName,
                  style: CommonTextStyle()
                      .boldBodyMedium(context, FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 50,
          child: RichText(
            text: TextSpan(
              text: "$name2 : ",
              style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
              children: [
                TextSpan(
                  text: secondName,
                  style: CommonTextStyle()
                      .boldBodyMedium(context, FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActiveVotesWidget extends StatelessWidget {
  const ActiveVotesWidget({
    super.key,
    required this.reshares,
    required this.voter,
  });

  final int reshares;
  final String voter;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            buildRowWidget(context, "Voters", voter),
            buildRowWidget(context, "Re-Shares", reshares.toString()),
          ],
        ),
      ),
    );
  }

  Widget buildRowWidget(BuildContext context, String firstName, String first) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: "$firstName : ",
            style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
            children: [
              TextSpan(
                text: first,
                style:
                    CommonTextStyle().boldBodyMedium(context, FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
