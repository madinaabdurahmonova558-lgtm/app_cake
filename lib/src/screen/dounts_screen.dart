import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'donut_detail_screen.dart';

class DonutsScreen extends StatefulWidget {
  const DonutsScreen({super.key});

  @override
  State<DonutsScreen> createState() => _DonutsScreenState();
}

class _DonutsScreenState extends State<DonutsScreen> {
  final List items = [
    ["assets/images/p1.png", "Sprinkle Berry Donut", "\$2.49"],
    ["assets/images/p2.png", "Choco Bliss Donut", "\$3.49"],
    ["assets/images/p3.png", "Oreo Crunch Donut", "\$5.29"],
    ["assets/images/p4.png", "Muffin Chocolate Donuts", "\$5.49"],
    ["assets/images/p5.png", "Double Chocolate Donut", "\$3.09"],
    ["assets/images/p6.png", "Single Donut", "\$2.00"],
  ];

  List filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void openDetail(BuildContext context, List item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            DonutDetailScreen(image: item[0], title: item[1], price: item[2]),
      ),
    );
  }

  /// 🔍 SEARCH FUNCTION
  void searchDonut(String query) {
    final result = items.where((item) {
      return item[1].toLowerCase().contains(query.toLowerCase());
    }).toList();

    /// 🔥 MATCH NI TEPAGA CHIQARISH
    result.sort((a, b) {
      final aMatch = a[1].toLowerCase().startsWith(query.toLowerCase());
      final bMatch = b[1].toLowerCase().startsWith(query.toLowerCase());

      if (aMatch && !bMatch) return -1;
      if (!aMatch && bMatch) return 1;
      return 0;
    });

    setState(() {
      filteredItems = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// TITLE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    "Donuts Screen",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ],
              ),
            ),

            /// BODY
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 6.h,
                          width: 6.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_back, size: 18.sp),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Container(
                            height: 6.h,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              onChanged: searchDonut,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                icon: Icon(Icons.search, color: Colors.white),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2.h),

                    /// GRID
                    Expanded(
                      child: GridView.builder(
                        itemCount: filteredItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.w,
                          mainAxisSpacing: 2.h,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];

                          return GestureDetector(
                            onTap: () => openDetail(context, item),
                            child: Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// IMAGE
                                  Expanded(
                                    child: Hero(
                                      tag: item[0],
                                      child: Image.asset(item[0]),
                                    ),
                                  ),

                                  SizedBox(height: 1.h),

                                  /// TITLE
                                  Text(
                                    item[1],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 1.h),

                                  /// PRICE + PLUS
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item[2],
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () => openDetail(context, item),
                                        child: Container(
                                          height: 4.5.h,
                                          width: 4.5.h,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF7A00),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
