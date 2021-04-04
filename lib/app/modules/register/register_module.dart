import 'package:Garage_Control/app/core/constants/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          AppRouters.REGISTER,
          child: (_, args) => RegisterPage(),
        ),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
