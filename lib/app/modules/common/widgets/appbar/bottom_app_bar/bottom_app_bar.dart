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
            _bottomBarIconButton(iconData: FeatherIcons.home, index: 0, text: "Anasayfa"),
            _bottomBarIconButton(iconData: Icons.location_city_rounded, index: 1, text: "Yakınlarda"),
            _bottomBarIconButton(iconData: Icons.chat_bubble_outlined, index: 2, text: "Mesajlarım"),
            _bottomBarIconButton(iconData: Icons.favorite, index: 3, text: "Beğendiklerim"),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomBarIconButton({required IconData iconData, required int index, required String text}) {
    return SizedBox(
      height: Utils.bottomBarHeight,
      width: Get.width * 0.25,
      child: IconButton(
        iconSize: Utils.normalIconSize * 1.25,
        icon: Column(
          children: [
            Icon(iconData, color: controller.tabIndex == index ? Get.theme.primaryColor : ColorTable.getTextColor),
            //if (controller.tabIndex == index) CustomText(text, textColor: Get.theme.primaryColor)
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
