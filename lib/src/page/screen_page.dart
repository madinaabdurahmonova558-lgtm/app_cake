import 'package:flutter/material.dart';
import 'nearli_page.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// BACK
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 60),

            /// SUMMARY CARD
            Container(
              height: 400,
              width: 300,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "So let’s go over everything",
                    style: TextStyle(fontSize: 15),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Your Stay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "The Peak, Camping & Caravan Site\n"
                    "2 people\n"
                    "1 Tent / 1 Car\n"
                    "No Pets\n"
                    "From 21/9/25 to 23/9/25",
                    style: TextStyle(fontSize: 15),
                  ),

                  SizedBox(height: 25),

                  Text(
                    "Extra Activities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Let’s Walk - Biking Tour\n"
                    "2 People\n"
                    "10:00 22/9/25",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// BOTTOM PRICE
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// PRICE
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "£124",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          "/£42 night",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// NEXT BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NearliPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Next >",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}