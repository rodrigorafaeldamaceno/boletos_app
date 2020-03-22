import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_app/pages/home/home.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnv().load('.env');

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
      ),
      home: MyHomePage(),
    );
  }
}
