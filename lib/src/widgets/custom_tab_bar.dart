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
    return Row(
      children: [
        /// 🔥 LEFT TAB (Saved Items)
        Expanded(
          child: GestureDetector(
            onTap: () => onTap(0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? const Color(0xFFFF7A00)
                    : const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: selectedIndex == 0
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  "Saved Items",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == 0
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 3.w),

        /// 🔥 RIGHT TAB (Add to Cart)
        Expanded(
          child: GestureDetector(
            onTap: () => onTap(1),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? const Color(0xFFFF7A00)
                    : const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: selectedIndex == 1
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == 1
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}