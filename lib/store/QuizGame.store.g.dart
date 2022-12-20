// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizGame.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizGameStore on _QuizGameStore, Store {
  late final _$secondsAtom =
      Atom(name: '_QuizGameStore.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_QuizGameStore.selectedIndex', context: context);

  @override
  int? get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int? value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_QuizGameStoreActionController =
      ActionController(name: '_QuizGameStore', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_QuizGameStoreActionController.startAction(
        name: '_QuizGameStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_QuizGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seconds: ${seconds},
selectedIndex: ${selectedIndex}
    ''';
  }
}
