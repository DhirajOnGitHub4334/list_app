import 'package:flutter/material.dart';

import '../Utils/common_code .dart';

class BlackListScreen extends StatefulWidget {
  const BlackListScreen({super.key});

  @override
  State<BlackListScreen> createState() => _BlackListScreenState();
}

class _BlackListScreenState extends State<BlackListScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Black List"),
      ),
      body: (args.isEmpty)
          ? CommonTextStyle.commonData("No Black List Screen")
          : Container(),
    );
  }
}
