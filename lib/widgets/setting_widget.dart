import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: const Center(
        child: Text("Forth Page",
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
