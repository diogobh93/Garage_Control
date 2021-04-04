import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class TitleRegister extends StatelessWidget {
  const TitleRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleDevice = MediaQuery.of(context).textScaleFactor;
    final widthScaleDevice = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cadastro de caminhão",
            style: TextStyle(
              color: AppColor.secondary,
              fontSize: 22 * textScaleDevice,
            ),
          ),
          Container(
            height: 4,
            width: 0.40 * widthScaleDevice,
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(5),
            ),
          )
        ],
      ),
    );
  }
}
