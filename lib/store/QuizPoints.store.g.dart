// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizPoints.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizPointStore on _QuizPointsStore, Store {
  late final _$pointsAtom =
      Atom(name: '_QuizPointsStore.points', context: context);

  @override
  int get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(int value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  late final _$_QuizPointsStoreActionController =
      ActionController(name: '_QuizPointsStore', context: context);

  @override
  void addPoint() {
    final _$actionInfo = _$_QuizPointsStoreActionController.startAction(
        name: '_QuizPointsStore.addPoint');
    try {
      return super.addPoint();
    } finally {
      _$_QuizPointsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subtractPoint() {
    final _$actionInfo = _$_QuizPointsStoreActionController.startAction(
        name: '_QuizPointsStore.subtractPoint');
    try {
      return super.subtractPoint();
    } finally {
      _$_QuizPointsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
points: ${points}
    ''';
  }
}
