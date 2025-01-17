import 'package:flutter/material.dart';

class CustomButtonWidgrt extends StatelessWidget {
  const CustomButtonWidgrt({
    super.key,
    required this.onTap,
    required this.onTap2,
    required this.btnName,
    required this.btnSecond,
  });

  final Function() onTap;
  final Function() onTap2;
  final String btnName;
  final String btnSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 40,
          child: ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(
              Icons.send,
            ),
            label: Align(alignment: Alignment.center, child: Text(btnName)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 40,
          child: ElevatedButton.icon(
            onPressed: onTap2,
            icon: const Icon(
              Icons.send,
            ),
            label: Text(btnSecond),
          ),
        ),
      ],
    );
  }
}
