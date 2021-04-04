import 'package:Garage_Control/app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/custom_widgets.dart';
import 'components/checkbox_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: appBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                TitleRegister(),
                CheckBoxRegister(),
                FormRegister()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_outlined,
          color: AppColor.secondary,
          size: 30,
        ),
        onPressed: () => Modular.to.pop(),
      ),
      elevation: 0,
    );
  }
}
