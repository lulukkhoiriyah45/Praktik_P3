import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Star"),
      ),
      body: const Center(
        child: Text(
          "coba jadi apapun  boleh",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}