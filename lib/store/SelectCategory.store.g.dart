// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SelectCategory.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectCategoryStore on _SelectCategoryStore, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_SelectCategoryStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_SelectCategoryStoreActionController =
      ActionController(name: '_SelectCategoryStore', context: context);

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo = _$_SelectCategoryStoreActionController.startAction(
        name: '_SelectCategoryStore.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$_SelectCategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
