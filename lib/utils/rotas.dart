import 'package:flutter/material.dart';
import 'package:graphql_app/pages/boletos/boleto_info_screen.dart';
import 'package:graphql_app/pages/home/home_controller.dart';

class Rotas {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeController());
        break;
      case 'boleto':
        return MaterialPageRoute(
            builder: (_) => BoletoInfoScreen(boleto: args));
        break;
    }
  }
}
