import 'package:flutter/material.dart';
import 'package:tractian/assets/general.dart';

class AssetsController {
  TextEditingController filtro = TextEditingController();
  bool expanded = false;
  bool sensor = false;
  bool critico = false;
  bool loading = false;

  void toggleSensor() {
    if (critico) {
      critico = false;
    }
    sensor = !sensor;
    filtrar();
  }

  void toggleCritico() {
    if (sensor) {
      sensor = false;
    }
    critico = !critico;
    filtrar();
  }

  void setLoading(bool value) {
    loading = value;
  }

  List<General> general = [];

  List<General> filteredGeneral = [];

  Future<void> getGeneral(String companyId) async {
    general.clear();
    general.addAll(await fetchGenerals(companyId));
    filteredGeneral.addAll(general);
  }

  void filtrar() {
    if (!sensor && !critico && filtro.text.isEmpty) {
      filteredGeneral = List.from(general);
      expanded = false;
      return;
    }

    if (sensor) {
      expanded = true;
      filteredGeneral = _filtrarFamiliaPorStatus(general, true);
    }

    if (critico) {
      expanded = true;
      filteredGeneral = _filtrarFamiliaPorStatus(general, false);
    }

    if (filtro.text.isNotEmpty) {
      expanded = true;
      filteredGeneral = _filtrarFamilia(general, filtro.text.toLowerCase());
    }
  }

  List<General> _filtrarFamilia(List<General> lista, String searchTerm) {
    List<General> resultado = [];

    for (var item in lista) {
      var filhosFiltrados = _filtrarFamilia(item.general, searchTerm);

      if (item.name.toLowerCase().contains(searchTerm) ||
          filhosFiltrados.isNotEmpty) {
        resultado.add(General(
          id: item.id,
          name: item.name,
          locationId: item.locationId,
          parentId: item.parentId,
          sensorType: item.sensorType,
          sensorId: item.sensorId,
          status: item.status,
          gatewayId: item.gatewayId,
          general: filhosFiltrados,
          isLocation: item.isLocation,
          isAsset: item.isAsset,
          isComponent: item.isComponent,
        ));
      }
    }

    return resultado;
  }

  List<General> _filtrarFamiliaPorStatus(
      List<General> lista, bool? isOperating) {
    List<General> resultado = [];

    for (var item in lista) {
      var filhosFiltrados = _filtrarFamiliaPorStatus(item.general, isOperating);

      bool statusCorresponde = false;
      if (isOperating == true) {
        statusCorresponde = item.status == 'operating';
      } else if (isOperating == false) {
        statusCorresponde = item.status == 'alert';
      }

      if (statusCorresponde || filhosFiltrados.isNotEmpty) {
        resultado.add(General(
          id: item.id,
          name: item.name,
          locationId: item.locationId,
          parentId: item.parentId,
          sensorType: item.sensorType,
          sensorId: item.sensorId,
          status: item.status,
          gatewayId: item.gatewayId,
          general: filhosFiltrados,
          isLocation: item.isLocation,
          isAsset: item.isAsset,
          isComponent: item.isComponent,
        ));
      }
    }

    return resultado;
  }
}
