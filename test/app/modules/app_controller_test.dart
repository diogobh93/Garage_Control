import 'package:Garage_Control/app/app_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  AppController controller;

  setUp(() {
    controller = AppController();
  });
  group('App Controller Test', () {
    test('List of vacancies isNotEmpty', () {
      expect(controller.listVacancys, isNotNull);
    });

    test('List of vacancies lenght 10', () {
      expect(controller.listVacancys.length, 10);
    });

    test('Add of vacancies', () {
      controller.setVacancyNumber('5');
      controller.setVacancyState('Ocupado');
      controller.onAddVacancy();
      final vacancy = controller.listVacancys[5];
      expect(vacancy.state, 'Ocupado');
    });
  });
}
