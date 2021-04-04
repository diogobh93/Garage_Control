import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/constants/app_routes.dart';
import 'modules/home/home_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRouters.HOME, module: HomeModule()),
        ModularRouter(AppRouters.REGISTER, module: RegisterModule()),
      ];
}
