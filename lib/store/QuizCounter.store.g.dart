// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizCounter.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashCounterState on _SplashCounterState, Store {
  late final _$segundosAtom =
      Atom(name: '_SplashCounterState.segundos', context: context);

  @override
  int get segundos {
    _$segundosAtom.reportRead();
    return super.segundos;
  }

  @override
  set segundos(int value) {
    _$segundosAtom.reportWrite(value, super.segundos, () {
      super.segundos = value;
    });
  }

  late final _$_SplashCounterStateActionController =
      ActionController(name: '_SplashCounterState', context: context);

  @override
  void iniciar(BuildContext context, QuizModel quiz) {
    final _$actionInfo = _$_SplashCounterStateActionController.startAction(
        name: '_SplashCounterState.iniciar');
    try {
      return super.iniciar(context, quiz);
    } finally {
      _$_SplashCounterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
segundos: ${segundos}
    ''';
  }
}
