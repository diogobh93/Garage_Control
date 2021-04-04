// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  final _$listVacancysAtom = Atom(name: '_AppController.listVacancys');

  @override
  ObservableList<VacancyModel> get listVacancys {
    _$listVacancysAtom.reportRead();
    return super.listVacancys;
  }

  @override
  set listVacancys(ObservableList<VacancyModel> value) {
    _$listVacancysAtom.reportWrite(value, super.listVacancys, () {
      super.listVacancys = value;
    });
  }

  final _$_AppControllerActionController =
      ActionController(name: '_AppController');

  @override
  dynamic onAddVacancy() {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.onAddVacancy');
    try {
      return super.onAddVacancy();
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listVacancys: ${listVacancys}
    ''';
  }
}
