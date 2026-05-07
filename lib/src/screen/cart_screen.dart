import 'package:app_cake/src/page/screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/cart_provider.dart';
import '../widgets/custom_tab_bar.dart';

class CartScreen extends StatefulWidget {
  final Function(int) onTabChange;

  const CartScreen({super.key, required this.onTabChange});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Item> items = [
    Item(name: "Lava Dream Cake", image: "assets/images/ry.png", price: 19.99),
    Item(name: "Creamy Birthday Cake", image: "assets/images/ik.png", price: 7.99),
    Item(name: "Muffin Chocolate Donuts", image: "assets/images/hg.png", price: 5.49),
    Item(name: "Salted caramel", image: "assets/images/pw.png", price: 5.00),
    Item(name: "Three Milk Cake", image: "assets/images/ol.png", price: 25.00),
    Item(name: "Snickerdoodle Cookies", image: "assets/images/sd.png", price: 1.90),
    Item(name: "Triple Chocolate Chunk Cookies", image: "assets/images/df.png", price: 2.79),
    Item(name: "Fudge Fantasy Cake", image: "assets/images/re.png", price: 18.99),
    Item(name: "Black forest Ice Cake", image: "assets/images/se.png", price: 24.99),
    Item(name: "Almond Cookies", image: "assets/images/ae.png", price: 2.00),
    Item(name: "Ferrero", image: "assets/images/de.png", price: 5.00),
    Item(name: "Oreo Chocolate Cake", image: "assets/images/ye.png", price: 11.99),
    Item(name: "Oreo Crunch Donut", image: "assets/images/we.png", price: 5.29),
    Item(name: "Chocolate Ice Cake", image: "assets/images/qe.png", price: 8.99),
  ];

  late List<int> counts;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    counts = List.generate(items.length, (index) => 1);
    calculateTotal();
  }

  void calculateTotal() {
    totalPrice = 0;
    for (int i = 0; i < items.length; i++) {
      totalPrice += items[i].price * counts[i];
    }
  }

  void removeItem(Item item) {
    setState(() {
      final i = items.indexOf(item);
      if (i != -1) counts.removeAt(i);
      items.remove(item);
      calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                    "MY CART",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              // Таб бар — переключение через PngScreen.onTabChange
              CustomTabBar(selectedIndex: 1, onTap: widget.onTabChange),

              SizedBox(height: 2.h),

              Expanded(
                child: items.isEmpty
                    ? Center(
                        child: Text(
                          "Корзина пуста",
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(bottom: 2.h),
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 26.h,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 1.5.h,
                        ),
                        itemBuilder: (_, i) {
                          final item = items[i];

                          return Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(item.image, height: 10.h),

                                Flexible(
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                                ),

                                Text(
                                  "\$${item.price}",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 13.sp,
                                  ),
                                ),

                                Text("x${counts[i]}"),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.orange,
                                        size: 18.sp,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (counts[i] > 0) counts[i]--;
                                          calculateTotal();
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.orange,
                                        size: 18.sp,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          counts[i]++;
                                          calculateTotal();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),

              Container(
                margin: EdgeInsets.only(top: 2.h),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenPage(),));
                      },
                       child: Container(
                        height: 40,
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all( // 🔥 mana bu qo‘shiladi
                           color: Colors.black,
                           width: 1,
                         ),
                        ),
                         child: Center(
                           child: Text(
                            "Next >",
                            style: TextStyle(fontWeight: FontWeight.bold),
                                               ),
                         ),
                       ),
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}