import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);
  static const path = '/page2';
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: TextButton(
        onPressed: () => GoRouter.of(context).pop(),
        child: Text('back'),
      ),
    );
  }
}
