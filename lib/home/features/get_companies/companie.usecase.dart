import 'package:dio/dio.dart';
import 'package:tractian/home/features/get_companies/companie.dto.dart';
import 'package:tractian/home/features/get_companies/companie.entity.dart';

class CompaniesUseCase {
  final Dio _dio = Dio();

  Future<List<Companie>> fetchCompanies() async {
    try {
      final response =
          await _dio.get('https://fake-api.tractian.com/companies');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Companie> companies = data.map((companyJson) {
          return CompanieDto.fromJson(companyJson);
        }).toList();

        return companies;
      } else {
        throw Exception('Falha ao carregar dados');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}
