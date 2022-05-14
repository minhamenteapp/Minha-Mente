import 'package:flutter/material.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/screens/projects_list.dart';
import 'package:minha_mente/screens/register_form.dart';

class DoLogin extends StatefulWidget {
  const DoLogin({Key? key}) : super(key: key);

  @override
  State<DoLogin> createState() => _DoLoginState();
}

class _DoLoginState extends State<DoLogin> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final double _fontSizeTitle = 26.0;
  final double _fontSizeBtns = 16.0;
  final ProjectDao _dao = ProjectDao();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _btnStyle = ElevatedButton.styleFrom(
      primary: Theme.of(context).colorScheme.tertiary,
      textStyle: TextStyle(
        fontSize: _fontSizeBtns,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(235, 202, 202, 1),
      ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                scale: 2.0,
              ),
              SizedBox(
                width: 10.0,
                height: 130.0,
                child: Card(
                  child: Text(''),
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MINHA',
                      style: TextStyle(
                        fontSize: _fontSizeTitle,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MENTE',
                      style: TextStyle(
                        fontSize: _fontSizeTitle,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: TextFormField(
              controller: _userController,
              style: TextStyle(
                fontSize: _fontSizeBtns,
                color: Theme.of(context).colorScheme.primary,
              ),
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
            child: TextFormField(
              controller: _passwordController,
              style: TextStyle(
                fontSize: _fontSizeBtns,
                color: Theme.of(context).colorScheme.primary,
              ),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                child: Text('Acessar'),
                style: _btnStyle,
                onPressed: () {
                  // final String user = _userController.text;
                  // final String password = _passwordController.text;
                  // if(_dao.verifyUser(user, password) == 0) {
                  //   AlertDialog(
                  //     title: const Text('Erro ao fazer Login'),
                  //     content: SingleChildScrollView(
                  //       child: Text('Preencha as informações!'),
                  //     ),
                  //     actions: [
                  //       TextButton(
                  //         onPressed: () {Navigator.of(context).pop();},
                  //         child: const Text('Ok'),
                  //       )
                  //     ],
                  //   );
                  // }else if (_dao.verifyUser(user, password) == 1) {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => ProjectsList(),
                  //   ));
                  // } else if (_dao.verifyUser(user, password) == 2) {
                  //   AlertDialog(
                  //     title: const Text('Erro ao fazer Login'),
                  //     content: SingleChildScrollView(
                  //       child: Text('Senha incorreta!'),
                  //     ),
                  //     actions: [
                  //       TextButton(
                  //         onPressed: () {Navigator.of(context).pop();},
                  //         child: const Text('Ok'),
                  //       )
                  //     ],
                  //   );
                  // } else {
                  //   AlertDialog(
                  //     title: const Text('Erro ao fazer Login'),
                  //     content: SingleChildScrollView(
                  //       child: Text('O usuário não existe!'),
                  //     ),
                  //     actions: [
                  //       TextButton(
                  //         onPressed: () {Navigator.of(context).pop();},
                  //         child: const Text('Ok'),
                  //       )
                  //     ],
                  //   );
                  // }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProjectsList(),
                  ));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                child: Text('Cadastrar'),
                style: _btnStyle,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterForm(),
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
