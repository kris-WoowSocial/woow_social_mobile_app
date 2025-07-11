import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glass/glass.dart';
import 'package:woow_social/core/constants/color_constants.dart';
import 'package:woow_social/core/constants/string_constant.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';
import 'package:get/get.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({Key? key, required this.selectedIndex}) : super(key: key);

  final RxInt selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dark1.withOpacity(0.85),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            tabItemView(
                svgPath: SvgConsstants.homeSelected,
                svgPathSelected: SvgConsstants.homeSelected,
                title: StringConstants.home,
                index: 0),
            tabItemView(
                svgPath: SvgConsstants.discoveryUnselected,
                svgPathSelected: SvgConsstants.discoveryUnselected,
                title: StringConstants.discover,
                index: 1),
            SvgPicture.asset(SvgConsstants.create),
            tabItemView(
                svgPath: SvgConsstants.inboxUnselected,
                svgPathSelected: SvgConsstants.inboxUnselected,
                title: StringConstants.inbox,
                index: 2),
            tabItemView(
                svgPath: SvgConsstants.profileUnselected,
                svgPathSelected: SvgConsstants.profileUnselected,
                title: StringConstants.profile,
                index: 3),
          ],
        ),
      ),
    ).asGlass();
  }

  tabItemView(
      {required String svgPath,
      required String svgPathSelected,
      required String title,
      required int index}) {
    return Expanded(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
                selectedIndex.value == index ? svgPathSelected : svgPath),
            Text(
              title,
              style: FontStyles.fontBold(
                color: selectedIndex.value == index
                    ? ColorConstants.primaryColor
                    : ColorConstants.grey500,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
