import "package:flutter/material.dart";

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text("Third Page",
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
