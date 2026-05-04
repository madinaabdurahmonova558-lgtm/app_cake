import 'package:app_cake/src/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: AssetImage('assets/images/hs.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'CakeCrave',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 70, left: 70),
                    child: Text(
                      'Discover a world of delicious cakes, from classic flavors to innovative creations, all in one app.',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 55.h),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                  child: Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        Center(
                          child: Text(
                            'Get Started Now',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
