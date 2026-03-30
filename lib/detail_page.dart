import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map coffee;

  const DetailPage({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffee["name"]),
      ),
      body: Column(
        children: [
          Image.network(
            coffee["image"],
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            coffee["name"],
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${coffee["price"]}",
            style: const TextStyle(fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Delicious coffee with rich taste and aroma.",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () {},
            child: const Text("Buy Now"),
          )
        ],
      ),
    );
  }
}