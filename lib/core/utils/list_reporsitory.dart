import '../contracts/request_models/filter_model.dart';
import 'base_list_model.dart';

abstract class ListRepository {
  Future<BaseListModel?> getAllData({int? page, FilterModel? filter, String? searchKey});
  const ListRepository();
}
