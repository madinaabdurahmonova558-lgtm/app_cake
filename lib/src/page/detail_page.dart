import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String price;
  final String image;

  const DetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔙 TOP BAR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  const Icon(Icons.favorite, color: Colors.orange),
                ],
              ),
            ),

            /// 🖼 IMAGE
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Image.asset(widget.image),
              ),
            ),

            /// 📦 CONTENT
            Container(
              padding: EdgeInsets.all(width * 0.05),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + COUNTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// 🔥 COUNTER BLOCK
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            /// ➖ MINUS
                            GestureDetector(
                              onTap: () {
                                if (count > 1) {
                                  setState(() => count--);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    const Icon(Icons.remove, size: 18),
                              ),
                            ),

                            /// 🔢 COUNT
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                count.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            /// ➕ PLUS
                            GestureDetector(
                              onTap: () {
                                setState(() => count++);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: width * 0.02),

                  /// ⭐ RATING
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_border),
                    ],
                  ),

                  SizedBox(height: width * 0.04),

                  /// DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    "Indulge in the ultimate chocolate experience with this Chocolate Ice Cake. This dessert features layers of creamy chocolate ice cream encased in velvety chocolate cake.\n\nTopped with smooth ganache glaze and chocolate shavings.",
                  ),

                  SizedBox(height: width * 0.05),

                  /// PRICE
                  Text(
                    "Price ${widget.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: width * 0.05),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text("Order Now"),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}