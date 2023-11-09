
import 'package:flutter/material.dart';
import 'package:voyager_1/views/ProductAdding/product_adding.dart';
import 'package:voyager_1/views/home/screenhome.dart';
import 'package:voyager_1/views/widgets/navbar/bottom.dart';


class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({
    super.key,
  });

  final _pages = [
    const ScreenHome(),
    const ProductAddingScreen(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationScreen(),
    );
  }
}
