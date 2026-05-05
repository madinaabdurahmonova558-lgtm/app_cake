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

  final TextEditingController searchController = TextEditingController();

  final categories = ["Cake", "Donuts", "Cookies"];
  final icons = [Icons.cake, Icons.circle, Icons.cookie];

  final List<List<String>> data = [
    ["Chocolate Ice Cake", "\$8.99", "assets/images/1.png"],
    ["Creamy Birthday Cake", "\$7.99", "assets/images/7.png"],
    ["Oreo Chocolate Cake", "\$11.99", "assets/images/5.png"],
    ["Lava Dream Cake", "\$19.99", "assets/images/8.png"],
    ["Wedding Cake", "\$10.99", "assets/images/6.png"],
    ["Fudge Cake", "\$9.99", "assets/images/2.png"],
    ["Milk Cake", "\$12.99", "assets/images/4.png"],
    ["Black Forest Cake", "\$13.99", "assets/images/3.png"],
  ];

  List<List<String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  /// 🔍 SEARCH FUNCTION
  void search(String value) {
    setState(() {
      filteredData = data
          .where((item) =>
              item[0].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

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

            /// HEADER
            ListTile(
              leading: CircleAvatar(
                radius: width * 0.06,
                backgroundImage:
                    const AssetImage("assets/images/9.png"),
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

            /// 🔍 SEARCH
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: search,
                        decoration: const InputDecoration(
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

            /// CATEGORY
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
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: width * 0.05),

            /// GRID
            Expanded(
              child: filteredData.isEmpty
                  ? const Center(child: Text("Ничего не найдено"))
                  : GridView.builder(
                      padding: EdgeInsets.all(width * 0.04),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: width * 0.04,
                        mainAxisSpacing: width * 0.04,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return _cakeCard(
                          filteredData[index][0],
                          filteredData[index][1],
                          filteredData[index][2],
                          width,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// CARD
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
                    color: Colors.orange,
                    fontSize: width * 0.035)),
          ],
        ),
      ),
    );
  }
}