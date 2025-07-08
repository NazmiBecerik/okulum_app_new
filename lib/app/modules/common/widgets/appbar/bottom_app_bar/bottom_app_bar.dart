import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../../texts/custom_text.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/variables/colors.dart';
import 'bottom_app_bar_controller.dart';

class CustomBottomAppBar extends GetView<BottomAppBarController> {
  final bool isDialogOpened;
  const CustomBottomAppBar({super.key, required this.isDialogOpened});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _bottomBarIconButton(iconData: FeatherIcons.home, index: 0, text: "Ana Sayfa"),
            _bottomBarIconButton(iconData: Icons.person_outline, index: 1, text: "Profil"),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomBarIconButton({required IconData iconData, required int index, required String text}) {
    return SizedBox(
      height: Utils.bottomBarHeight,
      width: Get.width * 0.5, // 2 buton olduğu için 0.5
      child: IconButton(
        iconSize: Utils.normalIconSize * 1.25,
        icon: Column(
          children: [
            Icon(iconData, color: controller.tabIndex == index ? Get.theme.primaryColor : ColorTable.getTextColor),
            CustomText.extraLow(text, textColor: controller.tabIndex == index ? Get.theme.primaryColor : ColorTable.getTextColor),
          ],
        ),
        onPressed: () {
          if (Get.isOverlaysOpen) return;
          controller.changeTabIndex(index: index);
        },
      ),
    );
  }
}
