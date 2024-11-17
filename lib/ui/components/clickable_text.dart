import 'package:flutter/material.dart';

class MyClickableText extends StatefulWidget {
  const MyClickableText({super.key});

  @override
  State<StatefulWidget> createState() => _MyStatefulText();
}

class _MyStatefulText extends State<MyClickableText> {
  int count = 0;
  void onPressed() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(ctx) {
    return TextButton(onPressed: onPressed, child: Text("Touch me:$count"));
  }
}