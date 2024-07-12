import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app_state.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationProvider.selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
      unselectedItemColor: Colors.grey,
      onTap: (index) => navigationProvider.navigateToIndex(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '관심매장',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: '지도',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: '주문내역',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '마이페이지',
        ),
      ],
    );
  }
}