import 'package:flutter/material.dart';
import '../components/list_item.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

class _Page1 extends State<Page1> {
  final List<Item> _items = List.empty(growable: true);

  void addItem(String a, String b, String c) {
    setState(() {
      _items.add(Item(a, b, c));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
      ),
      //drawer: Drawer(),
      //bottomNavigationBar: BottomAppBar(),
      body: Column(
        children: _items.map((item) => ListItem(item)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => addItem("A", "B", "C"),
          child: const Icon(Icons.add)
      ),
    );
  }
}