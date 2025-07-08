import 'package:flutter/material.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/attachmentBox/models/attachment_button_model.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/custom_elevated_button.dart';
import 'package:okulum_app/app/modules/common/widgets/texts/custom_text.dart';
import 'package:okulum_app/core/utils/utils.dart';

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({super.key, required this.button});
  final AttachmentButtonModel button;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          elevation: .1,
          backgroundColor: button.color,
          onPressed: button.onPressed,
          shape: const CircleBorder(),
          child: Icon(button.icon, size: Utils.highIconSize, color: Colors.white),
        ),
        SizedBox(height: Utils.extraLowPadding),
        CustomText(button.title),
      ],
    );
  }
}
