import 'package:flutter/material.dart';

import '../Utils/common_code .dart';

class RepliesListScreen extends StatefulWidget {
  const RepliesListScreen({super.key});

  @override
  State<RepliesListScreen> createState() => _RepliesListScreenState();
}

class _RepliesListScreenState extends State<RepliesListScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Replies List"),
      ),
      body: (args.isEmpty)
          ? CommonTextStyle.commonData("No Replies List Screen")
          : Container(),
    );
  }
}
