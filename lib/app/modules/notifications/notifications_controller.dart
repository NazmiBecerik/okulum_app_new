import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/getx_extensions.dart';

enum NotificationsState { Initial, Busy, Loaded, Error }

class NotificationsController extends GetxController {
  final Rx<NotificationsState> _state = NotificationsState.Initial.obs;
  NotificationsState get state => _state.value;
  set state(NotificationsState value) => _state.value = value;

  PageController pageController = PageController();
  List<String> activityList = ["Randevunuz tamamlandı", "Sırada son 2 kişi kaldı", "Randevunuz Alındı", "Randevunuz Alındı"];
  List<String> notificationList = ["Bildirim 1", "Bildirim 2", "Bildirim 3"];

  final Rx<int> _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;
  set selectedTab(int value) => _selectedTab.value = value;

  Map<int, String> pages = {0: "Aktiviteniz", 1: "Okunmamışlar"};

  @override
  void onInit() {
    ever(_state, (NotificationsState value) {
      switch (value) {
        case NotificationsState.Busy:
          Get.showProgressDialog();
          break;
        case NotificationsState.Loaded:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case NotificationsState.Error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });
    super.onInit();
  }

  void changeTabOnTap(TapProperties<int> props) {
    selectedTab = props.tapped?.value ?? 0;
    pageController.animateToPage(props.tapped?.value ?? 0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void extraOnTap() {}
}
