import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  height: 20,
                  width: 20,
                  color: AppColor.deYork,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Liberado'),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Row(
            children: [
              ClipOval(
                child: Container(
                  height: 20,
                  width: 20,
                  color: AppColor.sunglo,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Ocupado'),
            ],
          ),
        ],
      ),
    );
  }
}
