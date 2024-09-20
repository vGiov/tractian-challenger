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
}
