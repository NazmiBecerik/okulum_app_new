import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../common/widgets/buttons/custom_elevated_button.dart';
import 'widgets/activity_card.dart';
import 'widgets/notification_card.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';

import '../common/widgets/appbar/default_app_bar.dart';

import '../common/widgets/icons/icon_with_background.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../common/widgets/texts/custom_text.dart';
import 'notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Obx(() => animatedPageButtons()),
          SizedBox(height: Utils.normalPadding),
          pageView(),
        ],
      ),
    );
  }

  AnimatedToggleSwitch<int> animatedPageButtons() {
    return AnimatedToggleSwitch<int>.size(
      current: controller.selectedTab,
      values: controller.pages.keys.toList(),
      onTap: (props) => controller.changeTabOnTap(props),
      iconBuilder: (value) => CustomText(
        controller.pages[value],
        bold: true,
        textColor: value == controller.selectedTab ? ColorTable.getReversedTextColor : Get.theme.primaryColor,
      ),
      borderWidth: 1,
      styleBuilder: (value) => ToggleStyle(
        indicatorColor: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(Utils.lowRadius),
        borderColor: Get.theme.primaryColor,
      ),
      selectedIconScale: Utils.lowTextSize * 0.09,
      indicatorSize: Size(Get.width * 0.5, Utils.extraHighPadding * 2.3),
    );
  }

  Expanded pageView() {
    return Expanded(
      child: PageView(
        onPageChanged: (page) => controller.selectedTab = page,
        controller: controller.pageController,
        children: [activityList(), notificationList()],
      ),
    );
  }

  ListView notificationList() {
    return ListView.separated(
      itemBuilder: (context, index) => NotificationCar(notification: controller.notificationList[index]),
      separatorBuilder: (context, index) => SizedBox(height: Utils.normalPadding),
      itemCount: controller.notificationList.length,
    );
  }

  ListView activityList() {
    return ListView.separated(
      itemBuilder: (context, index) => ActivityCard(activity: controller.activityList[index]),
      separatorBuilder: (context, index) => SizedBox(height: Utils.normalPadding),
      itemCount: controller.activityList.length,
    );
  }

  InkWell rowButton(int index, String text) {
    return InkWell(
      onTap: () => controller.selectedTab != index
          ? controller.pageController.animateToPage(index, duration: const Duration(milliseconds: 250), curve: Curves.linear)
          : () {},
      child: SizedBox(
        width: Get.width * 0.4,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: controller.selectedTab == index ? Get.theme.primaryColor : Get.theme.primaryColorLight,
            borderRadius: BorderRadius.circular(Utils.normalRadius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Utils.normalPadding),
            child: CustomText.high(
              text,
              textColor: controller.selectedTab == index ? ColorTable.getReversedTextColor : Get.theme.primaryColor,
              centerText: true,
            ),
          ),
        ),
      ),
    );
  }

  DefaultAppBar buildAppBar() {
    return DefaultAppBar(
      onLeadingPressed: () => Get.back(),
      title: CustomText.extraHigh("Bildirimlerim"),
      leadingIcon: IconWithBackground.withIcon(icon: Icons.notifications, iconColor: Get.theme.primaryColor),
      actions: [extraIcon()],
    );
  }

  InkWell extraIcon() => InkWell(
        onTap: () => controller.extraOnTap(),
        child: CircleAvatar(
          radius: Utils.normalIconSize,
          backgroundColor: ColorTable.getTextColor.withOpacity(0.03),
          child: Icon(Icons.more_vert_rounded, color: ColorTable.getTextColor, size: Utils.normalIconSize),
        ),
      );
}
