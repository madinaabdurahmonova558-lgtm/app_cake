import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void removeItem(Item item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const Text(
                "MY CART",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              CustomTabBar(selectedIndex: 1, onTap: widget.onTabChange),

              const SizedBox(height: 15),

              Expanded(
                child: items.isEmpty
                    ? const Center(
                        child: Text(
                          "Корзина пуста",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 210,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (_, i) {
                          final item = items[i];

                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(item.image, height: 80),

                                Flexible(
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Text(
                                  "\$${item.price}",
                                  style: const TextStyle(color: Colors.orange),
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// МИНУС — удаляет товар из списка
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () => removeItem(item),
                                    ),

                                    /// ПЛЮС — добавляет в избранное
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () =>
                                          provider.toggleFavorite(item),
                                    ),
                                  ],
                                ),
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