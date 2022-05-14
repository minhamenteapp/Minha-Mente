import 'package:minha_mente/database/DAO/project_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'minhamente.db');
  return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(ProjectDao.tableSql);
        db.execute(ProjectDao.tableSqlSecond);
        db.execute(ProjectDao.tableSqlThird);
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
  );
}