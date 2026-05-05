import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_provider.dart';
import '../widgets/custom_tab_bar.dart';

class FavoriteScreen extends StatelessWidget {
  final Function(int) onTabChange;

  const FavoriteScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const Text(
                "MY FAVORITES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              /// TAB (НЕ ТРОГАЕМ)
              CustomTabBar(
                selectedIndex: 0,
                onTap: onTabChange,
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: provider.favorites.length,
                  itemBuilder: (_, i) {
                    final item = provider.favorites[i];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Image.asset(item.image, height: 45),
                          const SizedBox(width: 12),
                          Expanded(child: Text(item.name)),
                          const Icon(Icons.bookmark, color: Colors.orange),
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