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
}
