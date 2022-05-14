import 'package:minha_mente/database/app_database.dart';
import 'package:minha_mente/models/project.dart';
import 'package:minha_mente/models/team.dart';
import 'package:minha_mente/models/user.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDao {
  //      TABELA DE PROJETOS
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
      '$_projectName TEXT,'
      '$_info TEXT,'
      '$_teamId INTEGER)';

  //      TABELA DE USUARIOS
  static const String tableSqlSecond = 'CREATE TABLE $_tableSecondName('
      '$_username TEXT UNIQUE,'
      '$_email TEXT PRIMARY KEY,'
      '$_fullName TEXT,'
      '$_password TEXT)';

  //      TABELA DE EQUIPES
  static const String tableSqlThird = 'CREATE TABLE $_tableThirdName('
      '$_teamId INTEGER PRIMARY KEY,'
      '$_teamName TEXT UNIQUE,'
      '$_teamInfo TEXT)';

  //        CAMPOS DA TABELA DE PROJETOS
  static const String _tableName = 'projects';
  static const String _id = 'id';
  static const String _projectName = 'project_name';
  static const String _info = 'info';

  //        CAMPOS DA TABELA DE USUÁRIOS
  static const String _tableSecondName = 'users';
  static const String _username = 'username';
  static const String _email = 'email';
  static const String _fullName = 'fullname';
  static const String _password = 'password';

  //        CAMPOS DA TABELA DE EQUIPES
  static const String _tableThirdName = 'teams';
  static const String _teamId = 'teamId';
  static const String _teamName = 'team_name';
  static const String _teamInfo = 'team_info';

  //        INSTRUÇÕES PARA A TABELA DE PROJETOS
  Future<int> save(Project project) async {
    final Database db = await getDatabase();
    Map<String, dynamic> projectMap = _toMap(project);
    return db.insert(_tableName, projectMap);
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toMap(Project project) {
    final Map<String, dynamic> projectMap = Map();
    projectMap[_id] = project.id;
    projectMap[_projectName] = project.name;
    projectMap[_info] = project.info;
    projectMap[_teamId] = project.teamId;
    return projectMap;
  }

  Future<List<Project>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Project> projects = [];
    _toList(result, projects);
    return projects;
  }

  void _toList(List<Map<String, dynamic>> result, List<Project> projects) {
    for (Map<String, dynamic> row in result) {
      final Project project = Project(
        row[_id],
        row[_projectName],
        row[_info],
        row[_teamId],
      );
      projects.add(project);
    }
  }

  //        INSTRUÇÕES PARA A TABELA DE USUÁRIOS
  Future<int> saveUser(User user) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = _toMapUser(user);
    return db.insert(_tableSecondName, userMap);
  }

  Map<String, dynamic> _toMapUser(User user) {
    final Map<String, dynamic> userMap = Map();
    userMap[_username] = user.username;
    userMap[_email] = user.email;
    userMap[_fullName] = user.fullname;
    userMap[_password] = user.password;
    return userMap;
  }

  Future<List<User>> findAllUser() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultUser = await db.query(_tableSecondName);
    final List<User> users = [];
    _toListUser(resultUser, users);
    return users;
  }

  void _toListUser(List<Map<String, dynamic>> resultUser, List<User> users) {
    for (Map<String, dynamic> row in resultUser) {
      final User user = User(
        row[_username],
        row[_email],
        row[_fullName],
        row[_password],
      );
      users.add(user);
    }
  }

// Future<String> returnTBProjectsLength() async {
//   final Database db = await getDatabase();
//   int? projectsLength = int.tryParse(db.rawQuery('SELECT COUNT(*) FROM $_tableName').toString());
//   if (projectsLength == null) {
//     projectsLength = 0;
//   }
//   projectsLength += 1;
//   return projectsLength.toString();
// }

// Future<int> verifyUser(String connectUsername, String connectPassword) async {
// final Database db = await getDatabase();
// if (connectUsername.isEmpty || connectPassword.isEmpty) {
//   return 0;
// }else {
//   if(connectUsername == username && connectPassword == password) {
//     return 1;
//   }else if(connectUsername == username && connectPassword != password) {
//     return 2;
//   }else {
//     return 3;
//   }
// }
//   return 1;
// }

//        INSTRUÇÕES PARA A TABELA DE EQUIPES
  Future<int> saveTeam(Team team) async {
    final Database db = await getDatabase();
    Map<String, dynamic> teamMap = _toTeamMap(team);
    return db.insert(_tableThirdName, teamMap);
  }

  Future<int> deleteTeam(int teamId) async {
    final Database db = await getDatabase();
    return db.delete(_tableThirdName, where: '$_teamId = ?', whereArgs: [teamId]);
  }

  Map<String, dynamic> _toTeamMap(Team team) {
    final Map<String, dynamic> teamMap = Map();
    teamMap[_teamId] = team.teamId;
    teamMap[_teamName] = team.teamName;
    teamMap[_teamInfo] = team.teamInfo;
    return teamMap;
  }

  Future<List<Team>> findAllTeams() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultTeam = await db.query(_tableThirdName);
    final List<Team> teams = [];
    _toTeamList(resultTeam, teams);
    return teams;
  }

  Future<List<Project>> findAllProjectsTeam(int teamId) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultProjectsTeam = await db.query(_tableSecondName,where: '$_teamId = ?', whereArgs: [teamId]);
    final List<Project> projectsTeam = [];
    _toProjectsTeamList(resultProjectsTeam, projectsTeam);
    return projectsTeam;
  }

  void _toTeamList(List<Map<String, dynamic>> resultTeam, List<Team> teams) {
    for (Map<String, dynamic> row in resultTeam) {
      final Team team = Team(
        row[_teamId],
        row[_teamName],
        row[_teamInfo],
      );
      teams.add(team);
    }
  }

  void _toProjectsTeamList(List<Map<String, dynamic>> resultProjectsTeam, List<Project> projects) {
    for (Map<String, dynamic> row in resultProjectsTeam) {
      final Project project = Project(
        row[_id],
        row[_projectName],
        row[_info],
        row[_teamId],
      );
      projects.add(project);
    }
  }
}
