import 'package:flutter/material.dart';

class CommonTextStyle {
  TextStyle boldBodyMedium(BuildContext context, FontWeight weight) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: weight);
  }

  static commonData(String msg) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }

  static void commonDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Alert!",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            content: Text(
              msg,
              style: CommonTextStyle().boldBodyMedium(context, FontWeight.bold),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              )
            ],
          );
        });
  }
}
