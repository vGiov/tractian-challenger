import 'package:dio/dio.dart';

class Companie {
  final String name;
  final String id;
  Companie({required this.name, required this.id});

  factory Companie.fromJson(Map<String, dynamic> json) {
    return Companie(
      name: json['name'],
      id: json['id'],
    );
  }
}

Future<List<Companie>> fetchCompanies() async {
  final Dio dio = Dio();

  try {
    final response = await dio.get('https://fake-api.tractian.com/companies');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<Companie> companies = data.map((companyJson) {
        return Companie.fromJson(companyJson);
      }).toList();

      return companies;
    } else {
      throw Exception('Falha ao carregar dados');
    }
  } catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}
