import 'dart:async';

import 'package:Garage_Control/app/app_controller.dart';
import 'package:Garage_Control/app/core/constants/app_assets.dart';
import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:Garage_Control/app/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormRegister extends StatefulWidget {
  FormRegister({Key key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends ModularState<FormRegister, AppController> {
  final formKey = GlobalKey<FormState>();

  final plateController = TextEditingController();

  final hoursController = TextEditingController();

  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text("Informe os dados do caminhão e o horário correspondente:"),
          SizedBox(height: 40),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: plateController,
                  textCapitalization: TextCapitalization.characters,
                  maxLength: 7,
                  decoration: new InputDecoration(
                    labelText: 'Placa do veículo',
                    counterText: '',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    controller.setVacancyPlate(value);
                  },
                  validator: (value) {
                    //int index = int.parse(controller.vacancy.number);
                    // final vacancyType = controller.vacancy.state;
                    // final listVacancys = controller.listVacancys[index];

                    if (value.isEmpty) {
                      return 'Preencha o campo!';
                    }
                    if (value.length < 7 || value.length > 7) {
                      return 'A placa deve conter 7 caracteres!';
                    }
                    // if (vacancyType == 'Liberado' &&
                    //     listVacancys.plate != value) {
                    //   return 'A placa deve ser igual do veículo da vaga!';
                    // }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp("[a-zA-Z-0-9]"),
                        allow: true),
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: hoursController,
                  readOnly: true,
                  showCursor: false,
                  onTap: _showHoursPicker,
                  autofocus: false,
                  decoration: new InputDecoration(
                    labelText: 'Horário',
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.setVacancyShedule(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha o campo!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: numberController,
                  maxLength: 1,
                  decoration: new InputDecoration(
                    labelText: 'Número da vaga',
                    counterText: '',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    controller.setVacancyNumber(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha o campo!';
                    }
                    if (value.length > 1) {
                      return 'Vaga inexistente!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: _registerTruck,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "Cadastrar",
                style: TextStyle(color: AppColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _registerTruck() {
    if (formKey.currentState.validate()) {
      controller.onAddVacancy();
      _showDialogSuccess();
      Timer(Duration(seconds: 2), () {
        Modular.to.pushNamed(AppRouters.HOME);
      });
    }
  }

  _showDialogSuccess() {
    final deviceSize = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: deviceSize.height * 0.18,
            child: Column(
              children: [
                Image.asset(
                  AppAssets.sucess,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  'Cadastrado com sucesso!',
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _showHoursPicker() {
    String schedule;
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.black,
            accentColor: AppColor.primary,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    ).then((pickerTime) => {
          schedule = pickerTime.format(context).toString(),
          hoursController.text = schedule,
          controller.setVacancyShedule(schedule),
        });
  }
}
