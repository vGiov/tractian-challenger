

import 'package:tractian/assets/general.dart';

class AssetsController {
  bool sensor = false;
  bool critico = false;
  bool loading = false;

  void toggleSensor() {
    sensor = !sensor;
  }

  void toggleCritico() {
    critico = !critico;
  }

  void setLoading(bool value){
    loading = value;
  }

  List<General> general = [];

  Future<void>getGeneral(String companyId)async{
    general.addAll(await fetchGenerals(companyId));
  }
}
