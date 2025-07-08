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
      child: CustomCard(
        backgroundColor: Color(0xFF4FC3F7),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Utils.normalRadius)),
        child: Padding(
          padding: EdgeInsets.all(Utils.normalPadding),
          child: Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: Utils.extraHighIconSize * 0.8,
                backgroundColor: Colors.white.withOpacity(0.3),
                child: Icon(Icons.person, color: Colors.white, size: Utils.normalIconSize),
              ),
              SizedBox(width: Utils.normalPadding),

              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.high(controller.selectedStudent?.name ?? "Nazmi Becerik", textColor: Colors.white, bold: true),
                    SizedBox(height: Utils.extraLowPadding),
                    Row(
                      children: [
                        CustomText("Veli", textColor: Colors.white.withOpacity(0.9)),
                        SizedBox(width: Utils.extraLowPadding),
                        Icon(Icons.verified, color: Colors.white, size: Utils.lowIconSize),
                      ],
                    ),
                  ],
                ),
              ),

              // Action Buttons
              Column(
                children: [
                  profileButton(),
                  SizedBox(height: Utils.extraLowPadding),
                  changeButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileButton() {
    return CustomElevatedButton(
      backgroundColor: Colors.white.withOpacity(0.2),
      borderRadius: Utils.normalRadius,
      padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding, vertical: Utils.lowPadding),
      onPressed: () {
        // Profile action
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_outline, color: Colors.white, size: Utils.lowIconSize),
          SizedBox(width: Utils.extraLowPadding),
          CustomText.low("Profil", textColor: Colors.white, bold: true),
        ],
      ),
    );
  }

  Widget changeButton() {
    return CustomElevatedButton(
      backgroundColor: Colors.white.withOpacity(0.2),
      borderRadius: Utils.normalRadius,
      padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding, vertical: Utils.lowPadding),
      onPressed: () {
        // Change student action
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.swap_horiz, color: Colors.white, size: Utils.lowIconSize),
          SizedBox(width: Utils.extraLowPadding),
          CustomText.low("Değiştir", textColor: Colors.white, bold: true),
        ],
      ),
    );
  }
}
