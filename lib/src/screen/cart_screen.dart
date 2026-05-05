import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_provider.dart';
import '../widgets/custom_tab_bar.dart';

class CartScreen extends StatelessWidget {
  final Function(int) onTabChange;

  const CartScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();

    final items = [
      Item(
        name: "Lava Dream Cake",
        image: "assets/images/er.png",
        price: 19.99,
      ),
      Item(
        name: "Creamy Birthday Cake",
        image: "assets/images/er.png",
        price: 7.99,
      ),
      Item(
        name: "Muffin Chocolate Donuts",
        image: "assets/images/er.png",
        price: 5.49,
      ),
      Item(name: "Salted caramel", image: "assets/images/er.png", price: 5.00),
      Item(
        name: "Three Milk Cake",
        image: "assets/images/er.png",
        price: 25.00,
      ),
      Item(
        name: "Snickerdoodle Cookies",
        image: "assets/images/er.png",
        price: 1.90,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
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

              /// TAB (НЕ ТРОГАЕМ)
              CustomTabBar(selectedIndex: 1, onTap: onTabChange),

              const SizedBox(height: 15),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 230, // 🔥 увеличили высоту
                    crossAxisSpacing: 12,
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
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // 🔥 фикс
                        children: [
                          Image.asset(item.image, height: 80),

                          Flexible(
                            child: Text(
                              item.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis, // 🔥 фикс
                            ),
                          ),

                          Text(
                            "\$${item.price}",
                            style: const TextStyle(color: Colors.orange),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.orange,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.orange,
                                ),
                                onPressed: () => provider.toggleFavorite(item),
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
