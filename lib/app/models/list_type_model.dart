import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/utils/list_reporsitory.dart';

class ListTypeModel<T extends ListRepository> {
  String title;
  bool hasFilter;
  bool hasSearch;
  IconData titleIcon;
  T repository;
  bool hasPaginate;

  ListTypeModel({
    this.hasFilter = false,
    this.hasSearch = false,
    required this.title,
    required this.titleIcon,
    required this.repository,
    this.hasPaginate = true,
  });
  T get put {
    return Get.put(repository);
  }

  T get find {
    return Get.find<T>();
  }

  get delete {
    Get.delete<T>();
  }
}
