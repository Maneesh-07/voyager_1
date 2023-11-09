import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.black),
            unselectedIconTheme:
                const IconThemeData(color: Color.fromARGB(255, 82, 80, 80)),
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color.fromARGB(255, 71, 69, 69),
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Octicons.diff_added,
                ),
                label: 'Add Product',
              ),
            ]);
      },
    );
  }
}
