import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:Garage_Control/app/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonsRegister extends StatelessWidget {
  const ButtonsRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(AppRouters.REGISTER),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Cadastrar caminhão",
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
