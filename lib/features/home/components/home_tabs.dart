import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woow_social/core/constants/string_constant.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';

class HomeTabs extends StatelessWidget {
  final int selectedIndex;
  HomeTabs({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgConsstants.live,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _tabItemView(title: StringConstants.following),
                _tabItemView(title: StringConstants.friends),
                _tabItemView(title: StringConstants.forYou),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgConsstants.search,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabItemView({required String title}) {
    return SizedBox(
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
    );
  }
}
