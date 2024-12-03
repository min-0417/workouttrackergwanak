import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FramePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const FramePage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
            /*currentIndex가 현재 페이지(settings)의 인덱스(1)를 보여주고 home 탭을
            누를 경우 currentIndex는 운동하는 화면을 보여주며 인덱스가 0이 됨. 다시 한번
            home 탭을 누를 경우 index와 currentIndex가 0 == 0 이므로
            맨 처음 home 화면으로 돌아간다*/
          );
        },
      ),
    );
  }
}
