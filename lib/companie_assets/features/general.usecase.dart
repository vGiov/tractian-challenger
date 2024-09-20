import 'package:dio/dio.dart';
import 'package:tractian/companie_assets/features/general.dto.dart';
import 'package:tractian/companie_assets/features/general.entity.dart';

class GeneralsUseCase {
  final Dio _dio = Dio();

  Future<List<General>> getGeneral(String companieId) async {
    try {
      List<General> general = [];

      final responseLocation = await _dio
          .get('https://fake-api.tractian.com/companies/$companieId/locations');

      if (responseLocation.statusCode == 200) {
        List<dynamic> dataLocations = responseLocation.data;
        List<General> location = dataLocations.map((locationJson) {
          return GeneralDto.fromJsonLocations(locationJson);
        }).toList();
        general.addAll(location);

        final responseAsset = await _dio
            .get('https://fake-api.tractian.com/companies/$companieId/assets');

        if (responseAsset.statusCode == 200) {
          List<dynamic> dataAssets = responseAsset.data;
          List<General> assets = dataAssets.map((assetsJson) {
            return GeneralDto.fromJsonAssets(assetsJson);
          }).toList();
          general.addAll(assets);
        }

        return organizarLista(general);
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
}
