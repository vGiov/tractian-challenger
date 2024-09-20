import 'package:tractian/home/features/get_companies/companie.entity.dart';

class CompanieDto extends Companie {
  CompanieDto({required String name, required String id}) 
    : super(name: name, id: id);

  factory CompanieDto.fromJson(Map<String, dynamic> json) {
    return CompanieDto(
      name: json['name'],
      id: json['id'],
    );
  }
}
