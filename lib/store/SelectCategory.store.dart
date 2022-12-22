import 'package:mobx/mobx.dart';

part 'SelectCategory.store.g.dart';

class SelectCategoryStore = _SelectCategoryStore with _$SelectCategoryStore;

abstract class _SelectCategoryStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void changeSelectedIndex(int index) {
    selectedIndex = index;
  }
}
