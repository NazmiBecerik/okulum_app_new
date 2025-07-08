// lib/app/modules/home/widgets/home_user_card_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../common/controllers/user_controller.dart';
import '../../common/widgets/buttons/custom_elevated_button.dart';
import '../../common/widgets/card/custom_card.dart';
import '../../common/widgets/texts/custom_text.dart';

class HomeUserCardWidget extends GetView<UserController> {
  const HomeUserCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
      height: Get.height * 0.10, // Kartı küçülttük
      child: CustomCard(
        backgroundColor: Color(0xFF4FC3F7),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Utils.normalRadius)),
        child: Padding(
          padding: EdgeInsets.all(Utils.normalPadding * 0.8), // Padding'i biraz küçülttük
          child: Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: Utils.normalIconSize, // Küçülttük
                backgroundColor: Colors.white.withOpacity(0.3),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: Utils.lowIconSize, // İkon boyutunu küçülttük
                ),
              ),
              SizedBox(width: Utils.normalPadding),

              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.high(controller.selectedStudent?.name ?? "Test Öğrenci", textColor: Colors.white, bold: true),
                    Row(
                      children: [
                        CustomText.low(
                          // Text boyutunu küçülttük
                          "Veli",
                          textColor: Colors.white.withOpacity(0.9),
                        ),
                        SizedBox(width: Utils.extraLowPadding),
                        Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: Utils.extraLowIconSize, // İkon boyutunu küçülttük
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Sadece Değiştir Butonu
              changeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget changeButton() {
    return CustomElevatedButton(
      backgroundColor: Colors.white.withOpacity(0.2),
      borderRadius: Utils.lowRadius, // Radius küçülttük
      padding: EdgeInsets.symmetric(
        horizontal: Utils.lowPadding, // Padding küçülttük
        vertical: Utils.extraLowPadding,
      ),
      onPressed: () {
        // Change student action
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.swap_horiz,
            color: Colors.white,
            size: Utils.extraLowIconSize, // İkon boyutunu küçülttük
          ),
          SizedBox(width: Utils.extraLowPadding),
          CustomText.extraLow(
            // Text boyutunu küçülttük
            "Değiştir",
            textColor: Colors.white,
            bold: true,
          ),
        ],
      ),
    );
  }
}
