import 'package:Garage_Control/app/core/model/vacancy_model.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  @observable
  VacancyModel vacancy = new VacancyModel(state: 'Ocupado');

  @observable
  ObservableList<VacancyModel> listVacancys =
      new List<VacancyModel>.generate(10, (index) {
    return VacancyModel(number: '$index', state: 'Liberado');
  }).asObservable();

  @action
  onAddVacancy() {
    int index = int.parse(vacancy.number);
    listVacancys[index] = vacancy;
  }

  @action
  setVacancyState(String state) {
    vacancy.state = state;
  }

  @action
  setVacancyPlate(String plate) {
    vacancy.plate = plate;
  }

  @action
  setVacancyShedule(String schedule) {
    vacancy.schedule = schedule;
  }

  @action
  setVacancyNumber(String number) {
    vacancy.number = number;
  }
}
