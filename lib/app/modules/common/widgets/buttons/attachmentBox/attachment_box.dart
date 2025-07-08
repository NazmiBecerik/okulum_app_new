import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/attachmentBox/attachment_button_controller.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/attachmentBox/models/attachment_button_model.dart';
import 'package:okulum_app/core/utils/utils.dart';
import 'package:okulum_app/core/variables/enums.dart';

import 'attachment_button.dart';

class AttachmentBox extends GetView<AttachmentButtonController> {
  final Function(dynamic, AttachmentType) onTap;
  final bool showPhotoPreview;
  final bool showGallery;
  final bool showCamera;
  final bool showLocation;
  final bool showDocument;

  const AttachmentBox({
    super.key,
    required this.onTap,
    this.showPhotoPreview = false,
    this.showCamera = true,
    this.showDocument = true,
    this.showGallery = true,
    this.showLocation = true,
  });

  @override
  Widget build(BuildContext context) {
    controller.showPhotoPreview = showPhotoPreview;
    return Padding(
      padding: EdgeInsets.all(Utils.normalPadding),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Utils.normalRadius)),
        child: SizedBox(
          width: Get.width,
          height: Get.height * .3,
          child: Padding(
            padding: EdgeInsets.all(Utils.extraHighPadding * 2),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                if (showGallery)
                  AttachmentButton(
                    button:
                        (controller.attachmentButtons[AttachmentType.gallery] ??
                              AttachmentButtonModel(title: "Cant find", icon: Icons.error, color: Colors.red))
                          ..onPressed = () async {
                            Get.back();
                            final result = await controller.galleryOnTap();
                            onTap(result, AttachmentType.gallery);
                          },
                  ),
                if (showCamera)
                  AttachmentButton(
                    button:
                        (controller.attachmentButtons[AttachmentType.camera] ??
                              AttachmentButtonModel(title: "Cant find", icon: Icons.error, color: Colors.red))
                          ..onPressed = () async {
                            Get.back();
                            final result = await controller.cameraOnTap();
                            onTap(result, AttachmentType.camera);
                          },
                  ),
                if (showLocation)
                  AttachmentButton(
                    button:
                        (controller.attachmentButtons[AttachmentType.location] ??
                              AttachmentButtonModel(title: "Cant find", icon: Icons.error, color: Colors.red))
                          ..onPressed = () async {
                            Get.back();
                            final result = await controller.locationOnTap();
                            onTap(result, AttachmentType.location);
                          },
                  ),
                if (showDocument)
                  AttachmentButton(
                    button:
                        (controller.attachmentButtons[AttachmentType.document] ??
                              AttachmentButtonModel(title: "Cant find", icon: Icons.error, color: Colors.red))
                          ..onPressed = () async {
                            Get.back();
                            final result = await controller.fileOnTap();
                            onTap(result, AttachmentType.document);
                          },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
