import 'package:flutter/material.dart';
import 'get_started.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> coffees = const [
    {"name": "Cappuccino", "price": 4.53, "image": "https://images.unsplash.com/photo-1509042239860-f550ce710b93"},
    {"name": "Latte", "price": 3.90, "image": "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085"},
    {"name": "Espresso", "price": 2.50, "image": "https://images.unsplash.com/photo-1511920170033-f8396924c348"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Shop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: coffees.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final coffee = coffees[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage( ),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      coffee["image"],
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(coffee["name"]),
                    Text("\$${coffee["price"]}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}