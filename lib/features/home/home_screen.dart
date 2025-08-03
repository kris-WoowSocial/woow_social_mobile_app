import 'package:flutter/material.dart';
import 'package:woow_social/core/theme/app_theme.dart';
import 'package:woow_social/features/home/components/home_tabs.dart';
import 'package:woow_social/features/home/components/video_player_view.dart';
import 'package:woow_social/features/home/tabs/followings/home_tab_following.dart';
import 'package:woow_social/features/home/tabs/foryou/home_tab_foryou.dart';
import 'package:woow_social/features/home/tabs/friends/home_tab_friends.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController = PageController(initialPage: 2);
      _pageController.addListener(_onPageChanged);
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {});
  }

  var arrTabs = [
    HomeTabFollowing(),
    HomeTabFriends(),
    HomeTabForYou(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: arrTabs.length,
            itemBuilder: (context, index) {
              return arrTabs[index];
            },
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 50,
          child: HomeTabs(
            onTabSelected: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            selectedIndex: 2,
            onSearchPressed: () {},
            onLivePressed: () {},
          ),
        ),
      ],
    );
  }
}
