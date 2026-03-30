import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = [
      {
        "name": "Cappuccino",
        "subtitle": "with Chocolate",
        "price": "4.53",
        "rating": "4.8",
        "image":
        "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
      },
      {
        "name": "Cappuccino",
        "subtitle": "with Oat Milk",
        "price": "3.90",
        "rating": "4.9",
        "image":
        "https://images.unsplash.com/photo-1523942839745-7848d6b4b5c2",
      },
      {
        "name": "Cappuccino",
        "subtitle": "with Chocolate",
        "price": "4.20",
        "rating": "4.5",
        "image":
        "https://images.unsplash.com/photo-1510707577719-ae7c14805e68",
      },
      {
        "name": "Cappuccino",
        "subtitle": "with Oat Milk",
        "price": "3.80",
        "rating": "4.0",
        "image":
        "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: Column(
          children: [

            /// 🔥 TOP GRADIENT HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2B1E18), Color(0xFF1C1C1C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [

                  /// LOCATION + PROFILE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",
                              style: TextStyle(color: Colors.white54)),
                          SizedBox(height: 4),
                          Text(
                            "West, Balurghat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/1.jpg"),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// SEARCH BAR FLOAT STYLE
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search coffee",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFD17842),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CATEGORY
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  CategoryChip(title: "Cappuccino", selected: true),
                  CategoryChip(title: "Machiatto"),
                  CategoryChip(title: "Latte"),
                  CategoryChip(title: "Americano"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: coffees.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (_, index) {
                  final coffee = coffees[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// IMAGE + RATING
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: Image.network(
                                coffee["image"]!,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.orange, size: 14),
                                    const SizedBox(width: 2),
                                    Text(
                                      coffee["rating"]!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 10),

                        /// TEXT
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            coffee["name"]!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            coffee["subtitle"]!,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ),

                        const Spacer(),

                        /// PRICE + +
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${coffee["price"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD17842),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.add,
                                    color: Colors.white, size: 18),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// 🔥 BOTTOM NAV (MINIMAL STYLE)
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFD17842),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
    );
  }
}

/// CHIP
class CategoryChip extends StatelessWidget {
  final String title;
  final bool selected;

  const CategoryChip(
      {super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFD17842) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}