import 'package:app_cake/src/screen/account_screen.dart';
import 'package:app_cake/src/screen/dounts_screen.dart';
import 'package:app_cake/src/screen/png_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  int currentIndex = 0;

  final TextEditingController searchController = TextEditingController();

  final categories = ["Cake", "Donuts", "Cookies"];
  final icons = [Icons.cake, Icons.circle, Icons.cookie];

  List<List<String>> cakes = [
    ["Chocolate Ice Cake", "\$8.99", "assets/images/1.png"],
    ["Creamy Birthday Cake", "\$7.99", "assets/images/7.png"],
    ["Oreo Chocolate Cake", "\$11.99", "assets/images/5.png"],
    ["Lava Dream Cake", "\$19.99", "assets/images/8.png"],
    ["Wedding Cake", "\$10.99", "assets/images/6.png"],
    ["Fudge Cake", "\$9.99", "assets/images/2.png"],
    ["Milk Cake", "\$12.99", "assets/images/4.png"],
    ["Black Forest Cake", "\$13.99", "assets/images/3.png"],
  ];

  List<List<String>> donuts = [
    ["Sprinkle Berry Donut", "\$2.49", "assets/images/p1.png"],
    ["Choco Bliss Donut", "\$3.49", "assets/images/p2.png"],
    ["Oreo Crunch Donut", "\$5.29", "assets/images/p3.png"],
    ["Muffin Chocolate Donuts", "\$5.49", "assets/images/p4.png"],
    ["Double Chocolate Donut", "\$3.09", "assets/images/p5.png"],
    ["Single Donut", "\$2.00", "assets/images/p6.png"],
    ["Ferrero", "\$5.00", "assets/images/de.png"],
    ["Sultry Salted caramel", "\$5.00", "assets/images/pw.png"],
  ];

  List<List<String>> cookies = [
    ["Choco Chip Cookies", "\$1.99", "assets/images/er.png"],
    ["Double Chocolate Cookies", "\$2.19", "assets/images/ty.png"],
    ["Oatmeal Raisin Cookies", "\$1.79", "assets/images/di.png"],
    ["Macadamia Nut Cookies", "\$5.49", "assets/images/yh.png"],
    ["Peanut Butter Cookies", "\$2.19", "assets/images/te.png"],
    ["Snickerdoodle Cookies", "\$1.90", "assets/images/sd.png"],
    ["Triple Chocolate Chunk Cookies", "\$2.79", "assets/images/df.png"],
    ["Red Velvet Cookies", "\$2.49", "assets/images/sp.png"],
  ];

  List<List<String>> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = cakes;
  }

  void search(String value) {
    final current = _getCurrentList();

    setState(() {
      filtered = current
          .where((item) =>
              item[0].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  List<List<String>> _getCurrentList() {
    if (selectedCategory == 0) return cakes;
    if (selectedCategory == 1) return donuts;
    return cookies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 3.h),

            ListTile(
              leading: CircleAvatar(
                radius: 6.w,
                backgroundImage:
                    const AssetImage("assets/images/9.png"),
              ),
              title: Text(
                "Hey, Jacky",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              subtitle: Text(
                "Find and Get Your Favorite Cake",
                style: TextStyle(fontSize: 15.sp),
              ),
              trailing: Icon(Icons.menu, size: 6.w),
            ),

            Padding(
              padding: EdgeInsets.all(3.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                  SizedBox(width: 3.w),
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.tune,
                        color: Colors.white, size: 5.w),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(categories.length, (index) {
                final active = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                      filtered = _getCurrentList();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.w, vertical: 1.5.h),
                    decoration: BoxDecoration(
                      color: active
                          ? Colors.orange
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icons[index],
                          color:
                              active ? Colors.white : Colors.grey,
                          size: 5.w,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: active
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 2.h),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(3.w),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      Device.screenType == ScreenType.tablet ? 4 : 2,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.w,
                  childAspectRatio: 0.8,
                ),
                itemCount: filtered.length,
                itemBuilder: (_, i) {
                  return _card(
                    filtered[i][0],
                    filtered[i][1],
                    filtered[i][2],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// 🔥 ТОЛЬКО ЭТО ИЗМЕНИЛИ
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // ✅ ВСЕГДА HOME
        onTap: (index) {
          if (index == 0) return;

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DonutsScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PngScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const AccountScreen()),
            );
          }
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

class _card extends StatelessWidget {
  final String title, price, image;

  const _card(this.title, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                DetailPage(title: title, price: price, image: image),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(image)),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
            Text(price,
                style: TextStyle(
                    color: Colors.orange, fontSize: 13.sp)),
          ],
        ),
      ),
    );
  }
}