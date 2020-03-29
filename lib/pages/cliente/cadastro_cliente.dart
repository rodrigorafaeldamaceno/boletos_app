import 'package:flutter/material.dart';
import 'package:graphql_app/data/cliente/cliente_data.dart';
import 'package:graphql_app/pages/cliente/listar_clientes.dart';

class CreatePage extends StatelessWidget {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  DataCliente controller = DataCliente();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: <Widget>[
              customTextField('Nome', txtName),
              SizedBox(height: 10),
              customTextField(
                'Email',
                txtEmail,
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              customTextField(
                'Idade',
                txtPassword,
                type: TextInputType.number,
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () async {
                  await controller.criarCliente(
                    txtName.text,
                    txtEmail.text,
                    txtPassword.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListarClientesScreen(),
                    ),
                  );
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(String label, TextEditingController controller,
      {TextInputType type: TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: type,
    );
  }
}
