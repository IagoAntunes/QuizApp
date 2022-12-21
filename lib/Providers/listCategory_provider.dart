import 'package:flutter/material.dart';
import 'package:quizapp/Models/category_model.dart';

class ListCategoryProvider extends ChangeNotifier {
  List<CategoryModel> listCategory = [];

  setListCategory(List<CategoryModel> listCategoryParam) {
    listCategory = listCategoryParam;
  }

  List<CategoryModel> getListCategory() {
    return listCategory;
  }
}
