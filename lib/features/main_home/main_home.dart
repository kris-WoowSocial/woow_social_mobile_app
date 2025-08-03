import 'package:flutter/material.dart';
import 'package:woow_social/features/home/home_screen.dart';
import 'package:woow_social/features/main_home/components/bottom_tabs.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);

  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: IndexedStack(
              index: 0,
              children: [HomeScreen()],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomTabs(selectedIndex: selectedIndex),
          )
        ],
      ),
    );
  }
}
