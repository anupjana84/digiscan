import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  String parentId = "";
  String subCatId = "";
  String get _parentId => parentId;
  String get _subCatId => subCatId;
  void setParentId(value) {
    parentId = value;
    notifyListeners();
  }

  void setSubId(value) {
    subCatId = value;
    notifyListeners();
  }
}
