import 'package:flutter/material.dart';
import '../widgets/get_started_button.dart'; // Tetap import tombolnya

class CoffeeBreakScreen extends StatelessWidget {
  const CoffeeBreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
// --- BAGIAN ATAS: Gambar Coffee (70%) ---
        Expanded(
        flex: 7,
        child: SizedBox.expand(
          child: Image.asset(
            'assets/images/kopi.jpg',
            fit: BoxFit.cover,
// Logika penanganan jika gambar error/tidak ketemu
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.brown[300],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image, size: 80, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      'Gambar tidak ditemukan',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),

// --- BAGIAN BAWAH: Konten Teks & Tombol (30%) ---
      Expanded(
        flex: 3,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 47, 27, 14),
                Color.fromARGB(255, 53, 33, 19),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const SizedBox(height: 30),

// Teks Judul
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Time for a Coffee Break.....',
                style: TextStyle(
                  fontSize:
                  32, // Sedikit dikecilkan agar tidak overflow di layar kecil
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 15),

// Teks Deskripsi
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your daily dose of fresh brewed delivered to your doorstep. Start your coffee journey now!',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),

            const SizedBox(height: 40),

// Dot Indicator (Geser)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => Container(
                  width: index == 0 ? 24 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: index == 0
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                          : Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

// Tombol Get Started
          const GetStartedButton(),
          ],
        ),
      ),
    ),
    ),
    ],
    ),
    );
  }
}