import 'package:app_cake/src/widgets/item_model.dart';
import 'package:app_cake/src/widgets/items.dart' show items;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailScreen extends StatefulWidget {
  final ItemModel? item;
  final int? index;

  const DetailScreen({super.key, this.item, this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  int rating = 4;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item!;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.orange : Colors.grey,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(item.image, height: 30.h)),
            SizedBox(height: 2.h),

            Text(
              item.title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 1.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// ⭐ Рейтинг
                Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          rating = index + 1;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        color: index < rating ? Colors.amber : Colors.grey,
                        size: 18.sp,
                      ),
                    );
                  }),
                ),

                /// ➕➖
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count > 1) count--;
                          });
                        },
                        child: Icon(Icons.remove, size: 16.sp),
                      ),
                      SizedBox(width: 2.w),
                      Text("$count", style: TextStyle(fontSize: 16.sp)),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),

            Text(
              "Description",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 1.h),

            Text(
              item.description,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
            ),

            const Spacer(),

            Text(
              "Price  \$${item.price} per cookie",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.index! < items.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              item: items[widget.index! + 1],
                              index: widget.index! + 1,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}