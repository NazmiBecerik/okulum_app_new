import 'package:get/get.dart';
import '../../core/services/network/base_network_service.dart';
import '../../core/utils/serializer.dart';

import '../models/auth_models/login_model.dart';
import '../models/auth_models/register_model.dart';

class AuthRepository extends GetxService {
  final _baseNetworkService = Get.find<BaseNetworkService>();
  Future<BaseModel?> register({required RegisterModel registerModel}) async {
    return null;
  }

  Future<BaseModel?> login({required LoginModel loginModel}) async {
    return null;
  }
}
