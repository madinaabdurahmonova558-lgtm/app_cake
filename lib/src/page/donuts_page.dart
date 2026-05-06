import 'package:flutter/material.dart';
import 'detail_page.dart';

class DonutsPage extends StatelessWidget {
  const DonutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 👉 ПУСТОЙ СПИСОК (без ошибки)
    final List<List<String>> data = [];

    return Scaffold(
      appBar: AppBar(title: const Text("Donuts")),

      /// 🔥 ГЛАВНАЯ ЗАЩИТА
      body: data.isEmpty
          ? const Center(
              child: Text(
                "",
                style: TextStyle(fontSize: 18),
              ),
            )

          /// ЕСЛИ ЕСТЬ ДАННЫЕ
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemCount: data.length,
              itemBuilder: (context, i) {
                final item = data[i];

                /// 🔥 ДОП. ЗАЩИТА
                if (item.length < 3) {
                  return const SizedBox();
                }

                return _DonutCard(
                  item[0],
                  item[1],
                  item[2],
                );
              },
            ),
    );
  }
}

/// 🔥 КАРТОЧКА
class _DonutCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const _DonutCard(this.title, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                DetailPage(title: title, price: price, image: image),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(image)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: const TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}