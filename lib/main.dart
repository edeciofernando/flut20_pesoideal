import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo do Peso Ideal',
      home: HomePeso(),
    );
  }
}

class HomePeso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo do Peso Ideal'),
      ),
      body: ListView(
        children: <Widget>[
          PesoCab(),
          PesoForm(),
        ],
      ),
    );
  }
}

class PesoCab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Image.network(
          "https://portalbr.akamaized.net/brasil/uploads/2019/01/17170613/shutterstock_793868884.jpg",
          height: 120,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Informe seus dados",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class PesoForm extends StatefulWidget {
  @override
  _PesoFormState createState() => _PesoFormState();
}

class _PesoFormState extends State<PesoForm> {
  var _edNome = TextEditingController();
  String _rbSexo = '';
  var _edAltura = TextEditingController();
  String _mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _edNome,
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
              labelText: 'Paciente',
            ),
          ),
          ListTile(
            title: const Text('Masculino'),
            leading: Radio(
              value: 'M',
              groupValue: _rbSexo,
              onChanged: (value) {
                setState(() {
                  _rbSexo = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Feminino'),
            leading: Radio(
              value: 'F',
              groupValue: _rbSexo,
              onChanged: (value) {
                setState(() {
                  _rbSexo = value;
                });
              },
            ),
          ),
          TextFormField(
            controller: _edAltura,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
              labelText: 'Altura',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton(
              onPressed: () {
                double altura = double.parse(_edAltura.text);
                double peso;
                if (_rbSexo == 'M') {
                  peso = pow(altura, 2) * 22;
                } else {
                  peso = pow(altura, 2) * 21;
                }
                setState(() {
                  _mensagem =
                      '${_edNome.text} seu peso ideal é ${peso.toStringAsFixed(3)} kg';
                });
              },
              child: Text(
                ' Calcular ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _mensagem,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
