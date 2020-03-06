import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const DB_NAME = 'bytebank.db';
const VERSION = 1;

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), DB_NAME);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.tableSQL);
    },
    version: VERSION,
//      onDowngrade: onDatabaseDowngradeDelete,
  );
}