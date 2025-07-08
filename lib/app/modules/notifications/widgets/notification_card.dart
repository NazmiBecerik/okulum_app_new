import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../../../../core/utils/utils.dart';

class NotificationCar extends StatelessWidget {
  final String notification;
  const NotificationCar({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Get.theme.primaryColorLight, borderRadius: BorderRadius.circular(Utils.normalRadius)),
        child: Padding(
          padding: EdgeInsets.all(Utils.normalPadding),
          child: Row(
            children: [
              Icon(Icons.circle_notifications_rounded, color: Get.theme.primaryColor),
              SizedBox(width: Utils.normalPadding),
              Expanded(child: CustomText(notification)),
            ],
          ),
        ),
      ),
    );
  }
}
