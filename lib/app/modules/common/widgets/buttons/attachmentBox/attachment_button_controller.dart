import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okulum_app/app/modules/common/widgets/buttons/attachmentBox/component/image_preview.dart';

import 'models/attachment_button_model.dart';

enum AttachmentType { gallery, camera, document, location }

class AttachmentButtonController extends GetxController {
  File? selectedImage;
  bool showPhotoPreview = false;
  Map<AttachmentType, AttachmentButtonModel> get attachmentButtons => {
    AttachmentType.gallery: AttachmentButtonModel(title: "Galeri", icon: Icons.photo, color: Colors.blue),
    AttachmentType.camera: AttachmentButtonModel(title: "Kamera", icon: Icons.camera_alt, color: Colors.green),
    AttachmentType.location: AttachmentButtonModel(title: "Konum", icon: Icons.location_on, color: Colors.red),
    AttachmentType.document: AttachmentButtonModel(title: "Dosya", icon: Icons.attach_file, color: Colors.orange),
  };
  Future<dynamic> galleryOnTap() async {
    return await pickImage(openPreviewDialog: showPhotoPreview);
  }

  Future<dynamic> cameraOnTap() async {
    return await pickImage(openPreviewDialog: showPhotoPreview, isFromCamera: true);
  }

  Future<dynamic> locationOnTap() async {
    return 13; //Öylesine Eklendi ileride location datası dönecek
  }

  Future<dynamic> fileOnTap() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result?.files[0].path == null) return null;
    return File(result!.files[0].path!);
  }

  Future pickImage({isFromCamera = false, openPreviewDialog = false}) async {
    final returnedImage = await ImagePicker().pickImage(source: isFromCamera ? ImageSource.camera : ImageSource.gallery);
    if (returnedImage == null) return;
    selectedImage = File(returnedImage.path);
    if (openPreviewDialog) return await Get.dialog(const ImagePreview());
    return selectedImage;
  }
}
