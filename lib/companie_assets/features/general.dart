import 'package:dio/dio.dart';

class General {
  final String id;
  final String? locationId;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? sensorId;
  final String? status;
  final String? gatewayId;
  List<General> general;
  bool isLocation;
  bool isAsset;
  bool isComponent;
  General({
    required this.id,
    this.locationId,
    required this.name,
    this.parentId,
    this.sensorType,
    this.sensorId,
    this.status,
    this.gatewayId,
    required this.general,
    required this.isLocation,
    required this.isAsset,
    required this.isComponent,
  });

  factory General.fromJsonLocations(Map<String, dynamic> json) {
    return General(
        name: json['name'],
        id: json['id'],
        parentId: json['parentId'],
        gatewayId: null,
        status: null,
        sensorType: null,
        sensorId: null,
        locationId: null,
        isLocation: true,
        isComponent: false,
        isAsset: false,
        general: []);
  }

  factory General.fromJsonAssets(Map<String, dynamic> json) {
    bool isComponent = json['sensorType'] != null ? true : false;

    return General(
        name: json['name'],
        id: json['id'],
        parentId: json['parentId'],
        gatewayId: json['gatewayId'],
        status: json['status'],
        sensorType: json['sensorType'],
        sensorId: json['sensorId'],
        locationId: json['locationId'],
        isLocation: false,
        isComponent: isComponent,
        isAsset: !isComponent,
        general: []);
  }
}

Future<List<General>> fetchGenerals(String companieId) async {
  final Dio dio = Dio();

  try {
    List<General> general = [];
    final responseLocation = await dio
        .get('https://fake-api.tractian.com/companies/$companieId/locations');

    if (responseLocation.statusCode == 200) {
      List<dynamic> dataLocations = responseLocation.data;
      List<General> location = dataLocations.map((locationJson) {
        return General.fromJsonLocations(locationJson);
      }).toList();
      general.addAll(location);

      final responseAsset = await dio
          .get('https://fake-api.tractian.com/companies/$companieId/assets');

      if (responseAsset.statusCode == 200) {
        List<dynamic> dataAssets = responseAsset.data;
        List<General> assets = dataAssets.map((assetsJson) {
          return General.fromJsonAssets(assetsJson);
        }).toList();
        general.addAll(assets);
      }
      List<General> finalList = organizarLista(general);
      return finalList;
    } else {
      throw Exception('Falha ao carregar dados');
    }
  } catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}

List<General> organizarLista(List<General> listaOriginal) {
  List<General> listaOrganizada = [];

  for (var item in listaOriginal) {
    if (item.parentId == null && item.locationId == null) {
      listaOrganizada.add(item);
    }
  }

  void adicionarFilhos(General pai, List<General> lista) {
    for (var item in lista) {
      if (item.locationId == pai.id || item.parentId == pai.id) {
        pai.general.add(item);
        adicionarFilhos(item, lista);
      }
    }
  }

  for (var item in listaOrganizada) {
    adicionarFilhos(item, listaOriginal);
  }

  return listaOrganizada;
}
