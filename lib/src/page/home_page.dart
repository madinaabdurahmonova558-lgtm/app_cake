import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'donuts_page.dart';
import 'cookies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;

  final categories = ["Cake", "Donuts", "Cookies"];
  final icons = [Icons.cake, Icons.circle, Icons.cookie];

  final data = [
    ["Chocolate Ice Cake", "\$8.99", "assets/images/1.png"],
    ["Creamy Birthday Cake", "\$7.99", "assets/images/7.png"],
    ["Oreo Chocolate Cake", "\$11.99", "assets/images/5.png"],
    ["Lava Dream Cake", "\$19.99", "assets/images/8.png"],
    ["Wedding Cake", "\$10.99", "assets/images/6.png"],
    ["Fudge Cake", "\$9.99", "assets/images/2.png"],
    ["Milk Cake", "\$12.99", "assets/images/4.png"],
    ["Black Forest Cake", "\$13.99", "assets/images/3.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (width > 900) {
      crossAxisCount = 4;
    } else if (width > 600) {
      crossAxisCount = 3;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: width * 0.05),

            ListTile(
              leading: CircleAvatar(
                radius: width * 0.06,
                backgroundImage: const AssetImage("assets/images/9.png"),
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
                    child: Icon(Icons.tune, color: Colors.white, size: width * 0.05),
                  ),
                ],
              ),
            ),

            SizedBox(height: width * 0.05),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(categories.length, (index) {
                final active = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DonutsPage(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CookiesPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: width * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: active ? Colors.orange : Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: active
                          ? [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 10,
                              )
                            ]
                          : [],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icons[index],
                          color: active ? Colors.white : Colors.grey,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          categories[index],
                          style: TextStyle(
                            color: active ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: width * 0.05),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(width * 0.04),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.orange, size: width * 0.06),
                  Icon(Icons.store, color: Colors.grey, size: width * 0.06),
                  Icon(Icons.favorite, color: Colors.grey, size: width * 0.06),
                  Icon(Icons.person, color: Colors.grey, size: width * 0.06),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                    fontWeight: FontWeight.bold, fontSize: width * 0.035)),
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
                child: Icon(Icons.add, color: Colors.white, size: width * 0.04),
              ),
            ),
          ],
        ),
      ),
    );
  }
}