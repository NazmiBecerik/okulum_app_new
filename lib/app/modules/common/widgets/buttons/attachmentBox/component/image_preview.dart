import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/custom_elevated_button.dart';
import 'package:okulum_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:okulum_app/core/utils/utils.dart';
import 'package:okulum_app/core/variables/colors.dart';

import '../attachment_button_controller.dart';

class ImagePreview extends GetView<AttachmentButtonController> {
  const ImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: Utils.normalPadding, horizontal: Utils.normalPadding),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomElevatedButton(
          onPressed: () => Get.back(),
          backgroundColor: ColorTable.errorColor.withOpacity(.8),
          child: CustomText("Kapat", textColor: Colors.white),
        ),
        CustomElevatedButton(
          onPressed: () => Get.back(result: controller.selectedImage),
          backgroundColor: ColorTable.successColor.withOpacity(.75),
          child: CustomText("Devam et", textColor: Colors.white),
        ),
      ],
      content: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: SizedBox(child: controller.selectedImage != null ? Image.file(controller.selectedImage!) : CustomText("Image is not selected.")),
      ),
    );
  }
}
