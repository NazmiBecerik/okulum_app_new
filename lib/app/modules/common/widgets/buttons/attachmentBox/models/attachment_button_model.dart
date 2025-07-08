import 'package:flutter/material.dart';

class AttachmentButtonModel {
  String title;
  IconData icon;
  Color color;
  Function()? onPressed;

  AttachmentButtonModel({
    required this.title,
    required this.icon,
    required this.color,
    this.onPressed,
  });
}
