import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                '/home/hamed/Desktop/sec_page.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
