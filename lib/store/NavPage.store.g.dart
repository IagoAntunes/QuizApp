// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NavPage.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavPageStore on _NavPageStore, Store {
  late final _$currentIndexAtom =
      Atom(name: '_NavPageStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_NavPageStoreActionController =
      ActionController(name: '_NavPageStore', context: context);

  @override
  void toHome() {
    final _$actionInfo = _$_NavPageStoreActionController.startAction(
        name: '_NavPageStore.toHome');
    try {
      return super.toHome();
    } finally {
      _$_NavPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toSearch() {
    final _$actionInfo = _$_NavPageStoreActionController.startAction(
        name: '_NavPageStore.toSearch');
    try {
      return super.toSearch();
    } finally {
      _$_NavPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toStats() {
    final _$actionInfo = _$_NavPageStoreActionController.startAction(
        name: '_NavPageStore.toStats');
    try {
      return super.toStats();
    } finally {
      _$_NavPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toProfile() {
    final _$actionInfo = _$_NavPageStoreActionController.startAction(
        name: '_NavPageStore.toProfile');
    try {
      return super.toProfile();
    } finally {
      _$_NavPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
