import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DonutDetailScreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String tag; // 🔥 ОБЯЗАТЕЛЬНО

  const DonutDetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.tag, // 🔥 ОБЯЗАТЕЛЬНО
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// BACK
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, size: 18.sp),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔥 HERO
            Expanded(
              child: Hero(
                tag: tag,
                child: Image.asset(image),
              ),
            ),

            /// INFO
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  const Text("Delicious donut with amazing taste."),
                  SizedBox(height: 3.h),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }   
}