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

  String searchKey = "";

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
  }

  void settingsOnTap() async => Get.toNamed(AppRoutes.settings.path);

  void notificationsOnTap() async => Get.toNamed(AppRoutes.notif.path);

  void categoryOnTap() async => Get.toNamed(AppRoutes.list.path, arguments: {ArgumentEnum.listType.name: ListType.category});

  void serviceOnTap() async => Get.toNamed(AppRoutes.list.path, arguments: {ArgumentEnum.listType.name: ListType.service});

  void nearlyOnTap() async => Get.toNamed(AppRoutes.list.path, arguments: {ArgumentEnum.listType.name: ListType.shop});
}
