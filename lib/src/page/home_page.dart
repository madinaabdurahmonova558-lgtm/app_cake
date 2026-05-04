import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (width > 900) {
      crossAxisCount = 4;
    } else if (width > 600) {
      crossAxisCount = 3;
    }

    final data = [
      ["Chocolate Ice Cake", "\$8.99", "assets/images/1.png"],
      ["Creamy Birthday Cake", "\$7.99", "assets/images/7.png"],
      ["Oreo Chocolate Cake", "\$11.99", "assets/images/5.png"],
      ["Lava Dream Cake", "\$19.99", "assets/images/8.png"],
      ["Wedding Cake 3 Layers", "\$10.99", "assets/images/6.png"],
      ["Fudge Fantasy Cake", "\$9.99", "assets/images/2.png"],
      ["Three Milk Cake", "\$12.99", "assets/images/4.png"],
      ["Black Forest Ice Cake", "\$13.99", "assets/images/3.png"],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: width * 0.05),

                    /// HEADER
                    ListTile(
                      leading: CircleAvatar(
                        radius: width * 0.06,
                        backgroundImage: const NetworkImage(
                          "https://i.pravatar.cc/150?img=3",
                        ),
                      ),
                      title: Text(
                        "Hey, Jacky",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                        ),
                      ),
                      subtitle: Text(
                        "Find and Get Your Favorite Cake",
                        style: TextStyle(fontSize: width * 0.035),
                      ),
                      trailing: Icon(Icons.menu, size: width * 0.06),
                    ),

                    SizedBox(height: width * 0.03),

                    /// SEARCH
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.search),
                                  hintText: "Search",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Container(
                            padding: EdgeInsets.all(width * 0.03),
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.tune,
                                color: Colors.white, size: width * 0.05),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: width * 0.05),

                    /// TITLE
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Browse By Category",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: width * 0.03),

                    /// 🔥 CATEGORY WITH ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _category("Cake", true, width, Icons.cake),
                        _category("Donuts", false, width, Icons.circle),
                        _category("Cookies", false, width, Icons.cookie),
                      ],
                    ),

                    SizedBox(height: width * 0.05),

                    /// GRID
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(width * 0.04),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: width * 0.04,
                          mainAxisSpacing: width * 0.04,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return _cakeCard(
                            data[index][0],
                            data[index][1],
                            data[index][2],
                            width,
                          );
                        },
                      ),
                    ),

                    /// BOTTOM NAV
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.home,
                              color: Colors.orange, size: width * 0.06),
                          Icon(Icons.store,
                              color: Colors.grey, size: width * 0.06),
                          Icon(Icons.favorite,
                              color: Colors.grey, size: width * 0.06),
                          Icon(Icons.person,
                              color: Colors.grey, size: width * 0.06),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CATEGORY WIDGET
  static Widget _category(
      String title, bool active, double width, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        color: active ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon,
              size: width * 0.045,
              color: active ? Colors.white : Colors.grey),
          SizedBox(width: width * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: width * 0.035,
              color: active ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// CAKE CARD
class _cakeCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final double width;

  const _cakeCard(this.title, this.price, this.image, this.width);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              title: title,
              price: price,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: width * 0.02),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.035)),
            Text(price,
                style: TextStyle(
                    color: Colors.orange, fontSize: width * 0.035)),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(width * 0.015),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add,
                    color: Colors.white, size: width * 0.04),
              ),
            )
          ],
        ),
      ),
    );
  }
}