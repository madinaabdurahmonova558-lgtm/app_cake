import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DonutDetailScreen extends StatefulWidget {

  final String image;
  final String title;
  final String price;

  const DonutDetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<DonutDetailScreen> createState() => _DonutDetailScreenState();
}

class _DonutDetailScreenState extends State<DonutDetailScreen> {
  int count = 1;
  bool isFavorite = false;
  int rating = 4;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// 🔴 HEADER
          Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// BACK
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back, size: 18.sp),
                      ),
                    ),


                    /// ❤️ FAVORITE
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey(isFavorite),
                          color: Colors.orange,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ⚪ BODY
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(1.w),
                  topRight: Radius.circular(1.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔥 IMAGE
                  Transform.translate(
                    offset: Offset(0, -4.h),
                    child: Center(
                      child: Hero(
                        tag: widget.image,
                        child: Image.asset(
                          widget.image,
                          height: 32.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 1.h),

                  /// TITLE + COUNTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// 🔥 COUNTER (FIGMA STYLE)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            /// MINUS
                            GestureDetector(
                              onTap: () {
                                if (count > 1) {
                                  setState(() => count--);
                                }
                              },
                              child: Container(
                                height: 3.5.h,
                                width: 3.5.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.remove, size: 18.sp),
                              ),
                            ),

                            SizedBox(width: 2.w),

                            /// COUNT
                            Text(
                              "$count",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(width: 2.w),

                            /// PLUS
                            GestureDetector(
                              onTap: () {
                                setState(() => count++);
                              },
                              child: Container(
                                height: 3.5.h,
                                width: 3.5.h,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF7A00),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 1.h),

                  /// ⭐ RATING
                  Row(
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),

                  /// DESCRIPTION
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 1.h),

                  Text(
                    "Delight in the sweetness of our Sprinkle Berry Donut, a luscious strawberry-flavored donut topped with vibrant sprinkles.\n\nPerfect for satisfying your sweet cravings or adding a pop of color to your dessert.",
                    style: TextStyle(fontSize: 13.sp),
                  ),

                  const Spacer(),

                  /// PRICE
                  Text(
                    "Price ${widget.price}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Order Now",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Container(
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7A00),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
