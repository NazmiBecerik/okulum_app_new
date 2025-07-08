import 'serializer.dart';

class BaseListModel<T extends BaseModel> extends BaseModel {
  List<T>? records;
  int? offset;
  int? limit;
  int? page;
  int? prevPage;
  int? nextPage;
  T? type;

  BaseListModel({
    this.limit,
    this.nextPage,
    this.offset,
    this.page,
    this.prevPage,
    this.records,
    this.type,
  });
  @override
  fromJson(Map<String, dynamic> json) {
    if (type == null) return BaseListModel();
    return BaseListModel(
      records: modelListDecode<T>(json['data']?['records'], type!),
      offset: json['data']?['offset'],
      limit: json['data']?['limit'],
      page: json['data']?['page'],
      prevPage: json['data']?['prev_page'],
      nextPage: json['data']?['next_page'],
    );
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
