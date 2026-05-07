import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/cart_provider.dart';
import '../widgets/custom_tab_bar.dart';

class FavoriteScreen extends StatelessWidget {
  final Function(int) onTabChange;

  const FavoriteScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(3.w),
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              SizedBox(height: 1.h),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(width: 105),
                  Text(
                    "MY FAVORITES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              // Таб бар — переключение через PngScreen.onTabChange
              CustomTabBar(selectedIndex: 0, onTap: onTabChange),

              SizedBox(height: 2.h),

              Expanded(
                child: provider.favorites.isEmpty
                    ? Center(
                        child: Text(
                          "Избранное пусто",
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: provider.favorites.length,
                        itemBuilder: (_, i) {
                          final item = provider.favorites[i];

                          return Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Image.asset(item.image, height: 6.h),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                                Icon(Icons.bookmark,
                                    color: Colors.orange, size: 18.sp),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}