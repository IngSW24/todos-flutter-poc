import 'package:flutter/material.dart';

class Item {
  String a, b, c;
  Item(this.a, this.b, this.c);
}

class ListItem extends StatelessWidget {
  final Item item;

  const ListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(item.a),
          Text(item.b),
          Text(item.c),
        ],
      ),
    );
  }
}