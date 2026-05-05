import 'package:flutter/material.dart';
import 'detail_page.dart';

class CookiesPage extends StatelessWidget {
  const CookiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      ["Choco Cookie", "\$2.99", "assets/images/4.png"],
      ["Oreo Cookie", "\$3.49", "assets/images/5.png"],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Cookies")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (_, i) {
          return _card(data[i][0], data[i][1], data[i][2]);
        },
      ),
    );
  }
}

class _card extends StatelessWidget {
  final String title, price, image;
  const _card(this.title, this.price, this.image);

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
      child: Column(
        children: [
          Expanded(child: Image.asset(image)),
          Text(title),
          Text(price),
        ],
      ),
    );
  }
}