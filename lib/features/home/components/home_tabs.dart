import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woow_social/core/constants/string_constant.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';

class HomeTabs extends StatelessWidget {
  final Function(int index) onTabSelected;
  final int selectedIndex;
  final Function() onSearchPressed;
  final Function() onLivePressed;
  HomeTabs(
      {Key? key,
      required this.onTabSelected,
      required this.selectedIndex,
      required this.onSearchPressed,
      required this.onLivePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: Row(
        children: [
          IconButton(
            onPressed: onLivePressed,
            icon: SvgPicture.asset(
              SvgConsstants.live,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _tabItemView(title: StringConstants.following, index: 0),
                _tabItemView(title: StringConstants.friends, index: 1),
                _tabItemView(title: StringConstants.forYou, index: 2),
              ],
            ),
          ),
          IconButton(
            onPressed: onSearchPressed,
            icon: SvgPicture.asset(
              SvgConsstants.search,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabItemView({required String title, required int index}) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: SizedBox(
        height: 41,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              title,
              style: FontStyles.fontSemibold(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
