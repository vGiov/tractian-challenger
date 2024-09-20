import 'package:tractian/companie_assets/features/general.entity.dart';

class GeneralDto extends General {
  GeneralDto({
    required String name,
    required String id,
    String? parentId,
    String? gatewayId,
    String? status,
    String? sensorType,
    String? sensorId,
    String? locationId,
    required bool isLocation,
    required bool isComponent,
    required bool isAsset,
    required List<General> general,
  }) : super(
          name: name,
          id: id,
          parentId: parentId,
          gatewayId: gatewayId,
          status: status,
          sensorType: sensorType,
          sensorId: sensorId,
          locationId: locationId,
          isLocation: isLocation,
          isComponent: isComponent,
          isAsset: isAsset,
          general: general,
        );

  factory GeneralDto.fromJsonLocations(Map<String, dynamic> json) {
    return GeneralDto(
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
      general: [],
    );
  }

  factory GeneralDto.fromJsonAssets(Map<String, dynamic> json) {
    bool isComponent = json['sensorType'] != null;

    return GeneralDto(
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
      general: [],
    );
  }
}
