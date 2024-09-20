import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tractian/companie_assets/features/general.dart';
import 'package:tractian/home/features/get_companies/companie.entity.dart';

part 'companies_assets_controller.g.dart';

class CompaniesAssetsController = CompaniesAssetsControllerBase
    with _$CompaniesAssetsController;

abstract class CompaniesAssetsControllerBase with Store {
  late Companie companie;

  TextEditingController find = TextEditingController();

  @observable
  String _textFilter = '';

  @computed
  String get textFilter => _textFilter;

  @action
  void setTextFilter(String value) {
    _textFilter = value;
    filterNow();
  }

  @observable
  bool _sensor = false;

  @computed
  bool get sensor => _sensor;

  @action
  void setSensor(bool value) {
    _sensor = value;
    if (critical) {
      _critical = false;
    }
    filterNow();
  }

  @observable
  bool _critical = false;

  @computed
  bool get critical => _critical;

  @action
  void setCritical(bool value) {
    _critical = value;
    if (sensor) {
      _sensor = false;
    }
    filterNow();
  }

  @observable
  bool? _expanded;

  @computed
  bool? get expanded => _expanded;

  @action
  void setExpanded(bool? value) {
    _expanded = value;
  }

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @action
  void setLoading(bool value) {
    _loading = value;
  }

  List<General> general = [];

  @observable
  ObservableList<General> filteredGeneral = ObservableList<General>();

  Future<void> getGeneral(String companyId) async {
    general.clear();
    general.addAll(await fetchGenerals(companyId));
    filteredGeneral.addAll(general);
  }

  void filterNow() {
    filteredGeneral.clear();

    List<General> familyFiltered =
        _filterFamily(general, textFilter.toLowerCase());

    if (sensor || critical) {
      setExpanded(true);

      if (sensor) {
        filteredGeneral.addAll(_filterFamilyPorStatus(familyFiltered, true));
      } else {
        filteredGeneral.addAll(_filterFamilyPorStatus(familyFiltered, false));
      }
    } else {
      filteredGeneral.addAll(familyFiltered);
      if (textFilter.isEmpty) {
        setExpanded(null);
      } else {
        setExpanded(true);
      }
    }
  }

  List<General> _filterFamily(List<General> lista, String searchTerm) {
    if (searchTerm.isEmpty) {
      return lista;
    }

    List<General> resultado = [];

    for (var item in lista) {
      var sonFilters = _filterFamily(item.general, searchTerm);
      if (item.name.toLowerCase().contains(searchTerm) ||
          sonFilters.isNotEmpty) {
        resultado.add(General(
          id: item.id,
          name: item.name,
          locationId: item.locationId,
          parentId: item.parentId,
          sensorType: item.sensorType,
          sensorId: item.sensorId,
          status: item.status,
          gatewayId: item.gatewayId,
          general: sonFilters,
          isLocation: item.isLocation,
          isAsset: item.isAsset,
          isComponent: item.isComponent,
        ));
      }
    }

    return resultado;
  }

  List<General> _filterFamilyPorStatus(List<General> lista, bool? isOperating) {
    List<General> resultado = [];

    for (var item in lista) {
      var sonFilters = _filterFamilyPorStatus(item.general, isOperating);

      bool statusCorresponde = false;
      if (isOperating == true) {
        statusCorresponde = item.status == 'operating';
      } else if (isOperating == false) {
        statusCorresponde = item.status == 'alert';
      }

      if (statusCorresponde || sonFilters.isNotEmpty) {
        resultado.add(General(
          id: item.id,
          name: item.name,
          locationId: item.locationId,
          parentId: item.parentId,
          sensorType: item.sensorType,
          sensorId: item.sensorId,
          status: item.status,
          gatewayId: item.gatewayId,
          general: sonFilters,
          isLocation: item.isLocation,
          isAsset: item.isAsset,
          isComponent: item.isComponent,
        ));
      }
    }

    return resultado;
  }

  Future<void> loadingRequest() async {
    setLoading(true);
    await getGeneral(companie.id);
    setLoading(false);
  }
}
