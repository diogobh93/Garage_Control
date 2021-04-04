import 'package:flutter/material.dart';

import 'components/custom_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              TitleHome(),
              InfoBar(),
              TrucksHarrow(),
              ButtonsRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
