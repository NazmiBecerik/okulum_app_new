import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../../../../core/utils/utils.dart';

class ActivityCard extends StatelessWidget {
  final String activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    bool isFinish = Random().nextBool(); //TODO İLERİDE BACKENDEN(Modelden) GELECEK
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [iconSide(isFinish), SizedBox(width: Utils.highPadding), textSide()],
    );
  }

  Column textSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: Get.width * 0.75, child: CustomText(activity, bold: true)),
        SizedBox(width: Get.width * 0.75, child: CustomText.low("Hizmetiniz Tamamlandı falan falan filan açıklama metni")),
      ],
    );
  }

  CircleAvatar iconSide(bool isFinish) {
    return CircleAvatar(
      radius: Utils.normalIconSize,
      backgroundColor: Get.theme.primaryColorLight.withAlpha(80),
      child: Icon(
        isFinish ? Icons.check_circle_outline_outlined : Icons.circle_outlined,
        color: Get.theme.primaryColor,
        size: Utils.extraHighIconSize,
      ),
    );
  }
}
