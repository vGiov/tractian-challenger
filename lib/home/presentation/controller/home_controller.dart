import 'package:mobx/mobx.dart';
import 'package:tractian/home/features/get_companies/companie.entity.dart';
import 'package:tractian/home/features/get_companies/companie.usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  List<Companie> companies = [];

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @action
  void setLoading(bool value) {
    _loading = value;
  }

  Future<void> getCompanies() async {
    final companiesUseCase = CompaniesUseCase();
    companies.clear();
    setLoading(true);
    companies.addAll(await companiesUseCase.fetchCompanies());
    setLoading(false);
  }
}
