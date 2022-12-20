import 'package:mobx/mobx.dart';

part 'NavPage.store.g.dart';

class NavPageStore = _NavPageStore with _$NavPageStore;

abstract class _NavPageStore with Store {
  @observable
  int currentIndex = 0;

  @action
  void toHome() {
    if (currentIndex != 0) {
      currentIndex = 0;
    }
  }

  @action
  void toSearch() {
    if (currentIndex != 1) {
      currentIndex = 1;
    }
  }

  @action
  void toStats() {
    if (currentIndex != 2) {
      currentIndex = 2;
    }
  }

  @action
  void toProfile() {
    if (currentIndex != 3) {
      currentIndex = 3;
    }
  }
}
