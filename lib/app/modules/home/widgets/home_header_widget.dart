// lib/app/modules/home/widgets/home_header_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/utils.dart';
import '../../common/widgets/texts/custom_text.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.24, // 0.35'ten 0.28'e küçülttük
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF6B73FF), Color(0xFF9B59B6)]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Utils.extraHighRadius * 1.5),
          bottomRight: Radius.circular(Utils.extraHighRadius * 1.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // School Logo
          Container(
            width: Utils.extraHighIconSize * 1.5, // 2'den 1.5'e küçülttük
            height: Utils.extraHighIconSize * 1.5,
            decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: Icon(
              Icons.school,
              color: Colors.white,
              size: Utils.highIconSize, // extraHigh'dan high'a küçülttük
            ),
          ),
          SizedBox(height: Utils.normalPadding),

          // School Name
          CustomText.extraHigh("Atatürk Ortaokulu", textColor: Colors.white, bold: true),
          SizedBox(height: Utils.extraLowPadding),

          // Subtitle
          CustomText("Eğitimde Mükemmellik", textColor: Colors.white.withOpacity(0.9)),
        ],
      ),
    );
  }
}
