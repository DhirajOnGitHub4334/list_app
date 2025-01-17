import 'package:flutter/material.dart';

class StatsDataScreen extends StatefulWidget {
  const StatsDataScreen({super.key});

  @override
  State<StatsDataScreen> createState() => _StatsDataScreenState();
}

class _StatsDataScreenState extends State<StatsDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats Data"),
      ),
    );
  }
}
