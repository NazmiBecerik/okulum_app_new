// Bayraklar

import 'package:flutter/material.dart';
import 'package:okulum_app/app/models/list_type_model.dart';
import 'package:okulum_app/core/constants/app_constants.dart';

enum ArgumentEnum { listType, saloonChat }

enum Flags {
  tr,
  en;

  String get getFlag => AppConstants.flagPath(flagName: name);
}

enum ListType { service, category, shop }
