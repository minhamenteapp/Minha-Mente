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
          Image.asset(
            'images/logo.png',
            scale: 5.0,
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
