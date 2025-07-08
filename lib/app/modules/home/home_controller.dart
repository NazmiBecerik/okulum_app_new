import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../../core/variables/enums.dart';
import '../../../../core/utils/getx_extensions.dart';
import '../common/controllers/user_controller.dart';

enum HomeState { Initial, Busy, Loaded, Error }

class HomeController extends GetxController {
  final UserController userController = Get.find<UserController>();

  final Rx<HomeState> _state = HomeState.Initial.obs;
  HomeState get state => _state.value;
  set state(HomeState value) => _state.value = value;

  final Rx<bool> _hasUnreadNotifications = false.obs;
  bool get hasUnreadNotifications => _hasUnreadNotifications.value;

  @override
  void onInit() {
    ever(_state, (HomeState value) {
      switch (value) {
        case HomeState.Busy:
          Get.showProgressDialog();
          break;
        case HomeState.Loaded:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case HomeState.Error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });
    super.onInit();
    _checkNotifications();
  }

  /// Refresh all home data
  Future<void> refreshData() async {
    state = HomeState.Busy;
    await Future.delayed(Duration(seconds: 1)); // Simulate API call
    _checkNotifications();
    state = HomeState.Loaded;
  }

  /// Check for unread notifications
  void _checkNotifications() {
    // Simulate checking notifications
    _hasUnreadNotifications.value = true; // Demo purpose
  }

  // Navigation methods
  void settingsOnTap() async => Get.toNamed(AppRoutes.settings.path);
  void notificationsOnTap() async => Get.toNamed(AppRoutes.notif.path);
  void profileOnTap() async => Get.toNamed(AppRoutes.profile.path);
}
