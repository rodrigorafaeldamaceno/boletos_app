import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_app/pages/home/home_adm.dart';
import 'package:graphql_app/pages/home/home_controller.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_app/utils/rotas.dart';
import 'package:graphql_app/utils/tema.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
String defaultHome = 'home';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnv().load('.env');
  print(DotEnv().env['URL'].toString());

  return runApp(GraphQLProvider(
    client: graphQLConfiguration.client,
    child: CacheProvider(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 1),
          appBarTheme: AppBarTheme(color: Tema.corPrincipal)),
      initialRoute: defaultHome,
      onGenerateRoute: Rotas.generateRoute,
    );
  }
}
