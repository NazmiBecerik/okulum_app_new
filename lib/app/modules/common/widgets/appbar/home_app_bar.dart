import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../texts/custom_text.dart';
import '../../../../../core/variables/colors.dart';

import '../../../../../core/utils/utils.dart';

class HomeAppBar extends StatelessWidget {
  ///Title widgetını ortalar
  final bool centerTitle;

  final Widget? leadingIcon;

  ///App barın sağında listelenecek olan widgetlar
  final List<Widget>? actions;

  final Function()? onLeadingPressed;
  final double? leadingWidth;

  const HomeAppBar({Key? key, this.leadingIcon, this.actions, this.onLeadingPressed, this.centerTitle = false, this.leadingWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: Utils.appBarHeight,
      centerTitle: centerTitle,
      leadingWidth: Get.width * 0.1,
      automaticallyImplyLeading: false,
      title: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (leadingIcon != null) leadingIcon!,
            CircleAvatar(
              radius: Utils.highIconSize,

              child: CustomText.high("VK", bold: true, textColor: Get.theme.primaryColor), //Todo user modelden alınacak
            ),
            SizedBox(width: Utils.highPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.low(
                  "Hoşgeldin",
                  bold: true,
                  textColor: ColorTable.getTextColor.withOpacity(0.5),
                ),
                SizedBox(width: Get.width * 0.35, child: CustomText.high("Volkan Ket", bold: true)), //Todo user modelden alınacak
              ],
            ),
          ],
        ),
      ),
      actions: actions != null
          ? [
              Padding(
                padding: EdgeInsets.only(right: Utils.lowIconSize),
                child: Wrap(runAlignment: WrapAlignment.center, direction: Axis.horizontal, children: actions!),
              )
            ]
          : null,
    );
  }
}
