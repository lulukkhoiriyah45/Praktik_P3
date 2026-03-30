import 'package:flutter/material.dart';
import 'get_Started.dart';

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      home: CoffeeIntroPage(),
    );
  }
}

class CoffeeIntroPage extends StatelessWidget {
  const CoffeeIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C1404),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 8,
              child: Center(
                child: Image.asset(
                  'assets/images/kopi.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Time for a coffee break.....",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        buildDot(true),
                        buildDot(false),
                        buildDot(false),
                        buildDot(false),

                      ],
                    ),

                    SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDot(bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

//run debug..}uuu{

//try//

