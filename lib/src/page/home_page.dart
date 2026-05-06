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

  List<List<String>> donuts = [];
  List<List<String>> cookies = [];

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

            /// HEADER
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

            /// 🔍 SEARCH + FILTER ICON
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w),
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

                  /// 🔥 КНОПКА КАК НА СКРИНЕ
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 5.w,
                    ),
                  ),
                ],
              ),
            ),

            /// CATEGORY
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

            /// GRID
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
    );
  }
}

/// CARD
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