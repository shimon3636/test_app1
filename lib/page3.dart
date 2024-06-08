import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);
  static const path = '/page3';
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page3'),
      ),
      body: TextButton(
        onPressed: () => context.go("/page1"),
        child: Text('back'),
      ),
    );
  }
}
