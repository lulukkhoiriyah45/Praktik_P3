import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, String> coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Column(
          children: [
            // TOP IMAGE + BACK + FAVORITE
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.transparent,
                ),

                // CARD
                Positioned(
                  top: 80,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAME + RATING
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.coffee["name"]!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.orange, size: 18),
                                SizedBox(width: 5),
                                Text("4.5 (2,330)"),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(height: 5),
                        const Text(
                          "with Chocolate",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        // DESCRIPTION
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo...",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 5),
                        const Text(
                          "Read More",
                          style: TextStyle(color: Colors.orange),
                        ),

                        const SizedBox(height: 20),

                        // SIZE
                        const Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: ["S", "M", "L"].map((size) {
                            final isSelected = selectedSize == size;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.orange.withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.orange
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 30),

                        // PRICE + BUTTON
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Price",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "\$${widget.coffee["price"]}",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            // BUTTON
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text("Buy Now"),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // IMAGE CIRCLE
                Positioned(
                  top: 20,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                    NetworkImage(widget.coffee["image"]!),
                  ),
                ),

                // BACK BUTTON
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // FAVORITE
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}