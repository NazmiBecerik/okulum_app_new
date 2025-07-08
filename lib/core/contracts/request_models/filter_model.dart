class FilterModel {
  DateTime startDate;
  DateTime endDate;
  bool isBetween;
  int? customerId;
  String? customerName;
  int isPaid; //1: ödendi, 2: ödenmedi, 0 bütün hepsi
  int isPackage; //1: paket, 2: paket olmayanlar, 0 bütün hepsi
  int dateDropDownState; //1:today 2: week 3: month
  String? phone;
  int? staffId;
  String? staffName;
  int? catId;
  FilterModel(
      {required this.startDate,
      required this.endDate,
      this.customerId,
      this.customerName,
      this.isBetween = true,
      this.isPaid = 0,
      this.isPackage = 0,
      this.dateDropDownState = 1,
      this.staffId,
      this.staffName,
      this.catId,
      this.phone});

  bool isSame(FilterModel filterModel) {
    if (startDate != filterModel.startDate) return false;
    if (endDate != filterModel.endDate) return false;
    if (customerId != filterModel.customerId) return false;
    if (staffId != filterModel.staffId) return false;
    if (catId != filterModel.catId) return false;
    if (isPaid != filterModel.isPaid) return false;
    if (phone != filterModel.phone) return false;
    return true;
  }
}
