import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:woow_social/core/constants/color_constants.dart';
import 'package:woow_social/core/constants/string_constant.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';
import 'package:woow_social/routes/route_names.dart';
import 'package:woow_social/widgets/CustomButton.dart';

class OnBoardUser extends StatelessWidget {
  OnBoardUser({Key? key}) : super(key: key);

  final RxInt currentIndex = 0.obs;

  final PageController _pageController = PageController();

  final List<String> images = [
    SvgConsstants.onboarding1,
    SvgConsstants.onboarding2,
    SvgConsstants.onboarding3,
  ];

  final List<String> onboardingTitles = [
    StringConstants.onboardingTitle1,
    StringConstants.onboardingTitle2,
    StringConstants.onboardingTitle3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                            flex: 3, child: SvgPicture.asset(images[index])),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Text(
                                onboardingTitles[index],
                                textAlign: TextAlign.center,
                                style: FontStyles.fontBold(
                                  color: ColorConstants.grey900,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(3),
                          width: currentIndex.value == index ? 32 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: currentIndex.value == index
                                ? ColorConstants.primaryColor
                                : ColorConstants.grey300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          text: StringConstants.next,
          onPressed: () {
            if (currentIndex.value < 2) {
              currentIndex.value++;
              _pageController.animateToPage(
                currentIndex.value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Get.offAllNamed(RouteNames.loginCheck);
            }
          },
          margin: const EdgeInsets.all(20),
          allowGradient: true,
        )
      ],
    ));
  }
}
