import 'package:flutter/material.dart';
import 'package:nest_mart_and_grocery/data/topsellingMode.dart';

class TopSellingPage extends StatelessWidget {
  TopSellingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: topsellingItems.length,
      itemBuilder: (context, index) {
        final TopSelling items = topsellingItems[index];
        return ListTile(
          leading: Container(
            height: 80,
            child: Image.asset(items.image),
          ),
          title: Container(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              items.des,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text("\n\$ ${items.price}"),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "\n\$ ${items.price}  ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    new TextSpan(
                        text: '\$ ${items.oldPrice}',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// tp selling price

List<TopSelling> topsellingItems = [
  TopSelling(
      des: 'Nestle Original Coffee-Mate',
      image: 'assets/veg1.png',
      price: 32.85,
      oldPrice: 33.8),
  TopSelling(
      des: 'Nestle Original Coffee-Mate',
      image: 'assets/veg2.png',
      price: 32.35,
      oldPrice: 33.87),
  TopSelling(
      des: 'Nestle Original Coffee-Mate',
      image: 'assets/veg3.png',
      price: 32.67,
      oldPrice: 34.6)
];
