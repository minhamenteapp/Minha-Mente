import 'package:flutter/material.dart';
import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:minha_mente/models/user.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _userUsernameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userFullnameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userRePasswordController =
      TextEditingController();
  final ProjectDao _dao = ProjectDao();
  final double _fontSizeBtns = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: TextFormField(
                  controller: _userUsernameController,
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
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: _userEmailController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: _userFullnameController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
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
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  controller: _userPasswordController,
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
                padding: const EdgeInsets.only(top: 5.0, bottom: 34.0),
                child: TextFormField(
                  controller: _userRePasswordController,
                  style: TextStyle(
                    fontSize: _fontSizeBtns,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
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
                padding: const EdgeInsets.only(top: 36.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.tertiary,
                      textStyle: TextStyle(
                        fontSize: _fontSizeBtns,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 202, 202, 1),
                      ),
                    ),
                    child: Text('Create'),
                    onPressed: () {
                      final String username = _userUsernameController.text;
                      final String email = _userEmailController.text;
                      final String fullname = _userFullnameController.text;
                      final String password = _userPasswordController.text;
                      final User newUser =
                      User(username, email, fullname, password);
                      _dao
                          .saveUser(newUser)
                          .then((value) => Navigator.pop(context));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
