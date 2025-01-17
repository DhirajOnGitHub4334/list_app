import 'dart:developer';

import 'package:flutter/material.dart';

import '../Model/user_data_model.dart';
import '../Utils/common_code .dart';

class BeneficiaryListScreen extends StatefulWidget {
  const BeneficiaryListScreen({super.key});

  @override
  State<BeneficiaryListScreen> createState() => _BeneficiaryListScreenState();
}

class _BeneficiaryListScreenState extends State<BeneficiaryListScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as List<Beneficiary>;
    log("@@@@@@@@:${args.length} -- ${args.isEmpty}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beneficiary List"),
      ),
      body: (args.isEmpty)
          ? CommonTextStyle.commonData("No Beneficiary List Available")
          : ListView.builder(
              itemCount: args.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Account Number :",
                                style: CommonTextStyle()
                                    .boldBodyMedium(context, FontWeight.bold),
                              ),
                              Text(
                                args[index].account,
                                style: CommonTextStyle()
                                    .boldBodyMedium(context, FontWeight.w400),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Weight :",
                                style: CommonTextStyle()
                                    .boldBodyMedium(context, FontWeight.bold),
                              ),
                              Text(
                                args[index].weight.toString(),
                                style: CommonTextStyle()
                                    .boldBodyMedium(context, FontWeight.w400),
                              )
                            ],
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
