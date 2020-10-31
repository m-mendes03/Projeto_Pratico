import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Projeto Prático',
    initialRoute: '/list1',
    routes: {
      '/list1': (context) => TelaInicial(),
      '/list2': (context) => TelaInfo(),
      '/list3': (context) => TelaLogin(),
      '/list4': (context) => TelaLista(),
    },
  ));
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Text('Tela inicial'),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text('Info'),
              onTap: () {
                Navigator.pushNamed(context, '/list2');
              },
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/list3');
              },
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text('Lista'),
              onTap: () {
                Navigator.pushNamed(context, '/list4');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var formKey = GlobalKey<FormState>();
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  txtLogin.text = "";
                  txtSenha.text = "";
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/imagem01.jpg',
                scale: 1.5,
                alignment: Alignment.center,
              ),
              campoTexto('Login', txtLogin),
              campoTexto('Senha', txtSenha),
              RaisedButton(
                child: Text(
                  'Show',
                  style: TextStyle(color: Colors.grey[1000], fontSize: 15),
                ),
                color: Colors.blue[100],
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    setState(() {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alerta'),
                              content: Text(
                                  txtLogin.text + '\n' + txtSenha.text,
                                  style: TextStyle(fontSize: 15)),
                            );
                          });
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget campoTexto(rotulo, variavelControle) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: variavelControle,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      validator: (value) {
        return ((value) == null) ? "Informe o valor" : null;
      },
    ),
  );
}

class TelaInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\nAplicativo não acabado da ELetiva Programação para dispositivos móveis.',
                ),
              ],
            ),
            Row(
              children: [
                Text('Infelizmente, a pessoa não gosta de front end.\nSorry.')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TelaLista extends StatefulWidget {
  @override
  _TelaListaState createState() => _TelaListaState();
}

class _TelaListaState extends State<TelaLista> {
  var list = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Container(
                child: Center(
                  child: Text((list = list + 100).toString()),
                ),
              );
            }),
      ),
    );
  }
}
