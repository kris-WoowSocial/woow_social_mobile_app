import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:woow_social/core/constants/color_constants.dart';
import 'package:woow_social/core/constants/string_constant.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';

import '../../routes/route_names.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: SvgPicture.asset(SvgConsstants.login),
            ),
            const SizedBox(height: 28),
            Text(
              StringConstants.loginCheckTitle,
              style: FontStyles.fontBold(
                color: ColorConstants.grey900,
                fontSize: 40,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ColorConstants.grey200,
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  StringConstants.loginCheckSubTitle,
                  style: FontStyles.fontSemibold(
                    color: ColorConstants.grey900,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            if (Platform.isAndroid)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorConstants.grey200,
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SvgConsstants.google),
                      const SizedBox(width: 12),
                      Text(
                        StringConstants.continueWithGoogle,
                        style: FontStyles.fontSemibold(
                          color: ColorConstants.grey900,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (Platform.isIOS)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorConstants.grey200,
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.apple, color: ColorConstants.grey900),
                      const SizedBox(width: 12),
                      Text(
                        StringConstants.continueWithApple,
                        style: FontStyles.fontSemibold(
                          color: ColorConstants.grey900,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${StringConstants.dontHaveAccount} ",
                    style: FontStyles.fontSemibold(
                      color: ColorConstants.grey900,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    StringConstants.signUp,
                    style: FontStyles.fontBold(
                      color: ColorConstants.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () => Get.offAllNamed(RouteNames.mainHome),
        child: Text(
          StringConstants.skipLogin,
          style: FontStyles.fontBold(
            color: ColorConstants.grey900,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
