import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // Observables
  @observable
  int pageIndex = 1;

  // Actions
  @action
  changePageIndex(int newIndex) {
    pageIndex = newIndex;
  }

  @action
  changePageToEspecificIndex(int especificIndex) {
    pageIndex = especificIndex;
  }
}
