import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Second Page",
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
