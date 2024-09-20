// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_assets_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompaniesAssetsController on CompaniesAssetsControllerBase, Store {
  Computed<String>? _$textFilterComputed;

  @override
  String get textFilter =>
      (_$textFilterComputed ??= Computed<String>(() => super.textFilter,
              name: 'CompaniesAssetsControllerBase.textFilter'))
          .value;
  Computed<bool>? _$sensorComputed;

  @override
  bool get sensor => (_$sensorComputed ??= Computed<bool>(() => super.sensor,
          name: 'CompaniesAssetsControllerBase.sensor'))
      .value;
  Computed<bool>? _$criticalComputed;

  @override
  bool get critical =>
      (_$criticalComputed ??= Computed<bool>(() => super.critical,
              name: 'CompaniesAssetsControllerBase.critical'))
          .value;
  Computed<bool?>? _$expandedComputed;

  @override
  bool? get expanded =>
      (_$expandedComputed ??= Computed<bool?>(() => super.expanded,
              name: 'CompaniesAssetsControllerBase.expanded'))
          .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'CompaniesAssetsControllerBase.loading'))
      .value;

  late final _$_textFilterAtom =
      Atom(name: 'CompaniesAssetsControllerBase._textFilter', context: context);

  @override
  String get _textFilter {
    _$_textFilterAtom.reportRead();
    return super._textFilter;
  }

  @override
  set _textFilter(String value) {
    _$_textFilterAtom.reportWrite(value, super._textFilter, () {
      super._textFilter = value;
    });
  }

  late final _$_sensorAtom =
      Atom(name: 'CompaniesAssetsControllerBase._sensor', context: context);

  @override
  bool get _sensor {
    _$_sensorAtom.reportRead();
    return super._sensor;
  }

  @override
  set _sensor(bool value) {
    _$_sensorAtom.reportWrite(value, super._sensor, () {
      super._sensor = value;
    });
  }

  late final _$_criticalAtom =
      Atom(name: 'CompaniesAssetsControllerBase._critical', context: context);

  @override
  bool get _critical {
    _$_criticalAtom.reportRead();
    return super._critical;
  }

  @override
  set _critical(bool value) {
    _$_criticalAtom.reportWrite(value, super._critical, () {
      super._critical = value;
    });
  }

  late final _$_expandedAtom =
      Atom(name: 'CompaniesAssetsControllerBase._expanded', context: context);

  @override
  bool? get _expanded {
    _$_expandedAtom.reportRead();
    return super._expanded;
  }

  @override
  set _expanded(bool? value) {
    _$_expandedAtom.reportWrite(value, super._expanded, () {
      super._expanded = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: 'CompaniesAssetsControllerBase._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$filteredGeneralAtom = Atom(
      name: 'CompaniesAssetsControllerBase.filteredGeneral', context: context);

  @override
  ObservableList<General> get filteredGeneral {
    _$filteredGeneralAtom.reportRead();
    return super.filteredGeneral;
  }

  @override
  set filteredGeneral(ObservableList<General> value) {
    _$filteredGeneralAtom.reportWrite(value, super.filteredGeneral, () {
      super.filteredGeneral = value;
    });
  }

  late final _$CompaniesAssetsControllerBaseActionController =
      ActionController(name: 'CompaniesAssetsControllerBase', context: context);

  @override
  void setTextFilter(String value) {
    final _$actionInfo = _$CompaniesAssetsControllerBaseActionController
        .startAction(name: 'CompaniesAssetsControllerBase.setTextFilter');
    try {
      return super.setTextFilter(value);
    } finally {
      _$CompaniesAssetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSensor(bool value) {
    final _$actionInfo = _$CompaniesAssetsControllerBaseActionController
        .startAction(name: 'CompaniesAssetsControllerBase.setSensor');
    try {
      return super.setSensor(value);
    } finally {
      _$CompaniesAssetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCritical(bool value) {
    final _$actionInfo = _$CompaniesAssetsControllerBaseActionController
        .startAction(name: 'CompaniesAssetsControllerBase.setCritical');
    try {
      return super.setCritical(value);
    } finally {
      _$CompaniesAssetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpanded(bool? value) {
    final _$actionInfo = _$CompaniesAssetsControllerBaseActionController
        .startAction(name: 'CompaniesAssetsControllerBase.setExpanded');
    try {
      return super.setExpanded(value);
    } finally {
      _$CompaniesAssetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$CompaniesAssetsControllerBaseActionController
        .startAction(name: 'CompaniesAssetsControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CompaniesAssetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredGeneral: ${filteredGeneral},
textFilter: ${textFilter},
sensor: ${sensor},
critical: ${critical},
expanded: ${expanded},
loading: ${loading}
    ''';
  }
}
