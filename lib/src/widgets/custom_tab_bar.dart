import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      padding: EdgeInsets.all(0.6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          /// LEFT TAB (Saved Items)
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(0),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? Colors.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Saved Items",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// RIGHT TAB (Add to Cart)
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(1),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Colors.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}