import 'package:flutter/material.dart';
import 'package:cofcof/widgets/coffee_item_card.dart';
import '../models/coffee_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
// tinggi header
    double headerHeight = 280.0;
    double searchBarHeight = 52.0;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior:
              Clip.none, // Penting: Agar search bar bisa keluar jalur
              children: [
// 1. BAGIAN ATAS (ABU GELAP)
                Container(
                  height: headerHeight,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1C1C1C), // Warna
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildLocationHeader(), // Teks Lokasi & Foto Profil
                      ],
                    ),
                  ),
                ),

// 2. SEARCH BAR MENGGANTUNG DI TENGAH
                Positioned(
                  bottom:
                  -(searchBarHeight /
                      2), // Menaruh setengah tinggi ke bawah
                  left: 20,
                  right: 20,
                  child: _buildSearchBar(searchBarHeight),
                ),
              ],
            ),

// 3. BAGIAN BLOK BAWAH (WARNA PUTIH)
            const SizedBox(
              height: 35,
            ), // Beri jarak
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  _buildCategories(),
                  const SizedBox(height: 24),
                  _buildCoffeeGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget Lokasi & Profil
  Widget _buildLocationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Location",
              style: TextStyle(color: Color(0xFFB7B7B7), fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Text(
                  "West, Balurghat",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          ],
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: NetworkImage(
                'https://i.pravatar.cc/150?u=a042581f4e29026704d',
              ),
              image: AssetImage('assets/images/user.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

// Widget Search Bar
  Widget _buildSearchBar(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF313131),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search coffee",
          hintStyle: const TextStyle(color: Color(0xFF989898)),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          suffixIcon: Container(
            margin: const EdgeInsets.all(6),
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E), // Warna cokelat filter
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 20),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

// Bagian Kategori
  Widget _buildCategories() {
    List<String> categories = ["Cappuccino", "Machiato", "Latte", "Americano"];
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFC67C4E) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? null
                  : Border.all(color: const Color(0xFFEDEDED)),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

// Coffee Grid
  Widget _buildCoffeeGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        itemCount: listCoffee.length,
        itemBuilder: (context, index) {
          return CoffeeItemCard(coffee: listCoffee[index]);
        },
      ),
    );
  }

// Bottom Navigation
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, color: Color(0xFFC67C4E)),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline, color: Colors.grey),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_rounded, color: Colors.grey),
          label: "",
        ),
      ],
    );
  }
}