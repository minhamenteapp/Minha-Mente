import 'package:flutter/material.dart';
import 'package:minha_mente/screens/login.dart';
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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(107, 127, 242, 1),
          secondary: Color.fromRGBO(240, 242, 242, 1),
          tertiary: Color.fromRGBO(65, 92, 242, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(240, 242, 242, 1),
      ),
      home: DoLogin(),
      //doLogin(),
    );
  }
}
