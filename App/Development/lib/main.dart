import 'package:flutter/material.dart';
import 'package:minha_mente/screens/projects_list.dart';

void main() {
  runApp(const MinhaMente());
  // final ProjectDao _dao = ProjectDao();
  // _dao.saveUser(User('brunocheles', 'bruno.cheles@outlook.com', 'Bruno de Oliveira Cheles', 'Bruno@123')).then((value) {
  //   _dao.findAllUser().then((users) => debugPrint(users.toString()));
  // });
}

class MinhaMente extends StatelessWidget {
  const MinhaMente({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(3, 28, 50, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(3, 28, 50, 1),
          secondary: Color.fromRGBO(235, 202, 202, 1),
          tertiary: Color.fromRGBO(179, 54, 91, 1),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(179, 54, 91, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(3, 28, 50, 1),
      ),
      home: ProjectsList(),
      //doLogin(),
    );
  }
}
