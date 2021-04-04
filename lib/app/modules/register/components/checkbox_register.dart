import 'package:Garage_Control/app/app_controller.dart';
import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CheckBoxRegister extends StatefulWidget {
  CheckBoxRegister({Key key}) : super(key: key);

  @override
  _CheckBoxRegisterState createState() => _CheckBoxRegisterState();
}

class _CheckBoxRegisterState
    extends ModularState<CheckBoxRegister, AppController> {
  bool access = true;
  bool exit = false;

  @override
  void initState() {
    super.initState();
  }

  onChangeCheckBox() {
    setState(() {
      access = !access;
      exit = !exit;
    });

    access
        ? controller.setVacancyState('Ocupado')
        : controller.setVacancyState('Liberado');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: AppColor.white,
          activeColor: AppColor.primary,
          value: this.access,
          onChanged: (_) {
            onChangeCheckBox();
          },
        ),
        Text('Entrada'),
        SizedBox(
          width: 30,
        ),
        Checkbox(
          checkColor: AppColor.white,
          activeColor: AppColor.primary,
          value: this.exit,
          onChanged: (_) {
            onChangeCheckBox();
          },
        ),
        Text('Saída'),
      ],
    );
  }
}
