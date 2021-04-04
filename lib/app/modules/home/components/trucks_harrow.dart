import 'package:Garage_Control/app/core/constants/app_assets.dart';
import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:Garage_Control/app/core/model/vacancy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_controller.dart';

class TrucksHarrow extends StatefulWidget {
  const TrucksHarrow({Key key}) : super(key: key);

  @override
  _TrucksHarrowState createState() => _TrucksHarrowState();
}

class _TrucksHarrowState extends ModularState<TrucksHarrow, AppController> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: harrow(deviceSize),
    );
  }

  Widget harrow(Size deviceSize) {
    return Observer(builder: (_) {
      return Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        spacing: 15,
        children: controller.listVacancys
            .map(
              (item) {
                bool occupied = item.state.contains('Ocupado');
                return GestureDetector(
                  onTap: () => showDialogVacancy(item),
                  child: Container(
                    height: deviceSize.height * 0.10,
                    width: deviceSize.width * 0.40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: occupied ? AppColor.pastelPink : AppColor.zanah,
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
                    child: occupied
                        ? vacancyOccupied(item, deviceSize)
                        : Text("${item.number}"),
                  ),
                );
              },
            )
            .toList()
            .cast<Widget>(),
      );
    });
  }

  Widget vacancyOccupied(item, deviceSize) {
    return Container(
      height: deviceSize.height * 0.10,
      width: deviceSize.width * 0.40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.pastelPink,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.plate,
            style: TextStyle(
              fontSize: 12,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: AppColor.white,
                  offset: Offset(3.0, 4.0),
                ),
              ],
            ),
          ),
          Image.asset(
            AppAssets.truck,
            height: 30,
          ),
        ],
      ),
    );
  }

  showDialogVacancy(VacancyModel item) {
    final deviceSize = MediaQuery.of(context).size;
    bool vacancyOccupied = item.state.contains('Ocupado');
    bool vacancyReleased =
        item.plate != null && item.state.contains('Liberado');

    String vacancyTitle = vacancyOccupied ? 'Vaga ocupada' : 'Vaga liberada';
    String vacancyDescription = !vacancyReleased && vacancyOccupied
        ? 'Dados do caminhão\n'
        : 'Dados do último caminhão\n';
    String truckInformation = item.plate != null
        ? 'Placa: ${item.plate} \nHorário: ${item.schedule} \nVaga: ${item.number}'
        : 'Vaga: ${item.number}';

    Text description = item.plate != null
        ? Text(vacancyDescription)
        : Text('Nenhum caminhão cadastrado!\n');

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(vacancyTitle),
          content: Container(
            height: deviceSize.height * 0.18,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                description,
                Text(truckInformation),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text(
                'Fechar',
                style: TextStyle(color: AppColor.sunglo),
              ),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
