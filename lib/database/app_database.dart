import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const VERSION = 1;
const DB_NAME = 'bytebank.db';
const CONTACTS_TABLE = 'contacts';
const CONTACTS_ID = 'id';
const CONTACTS_NAME = 'name';
const CONTACTS_ACCOUNT_NUMBER = 'account_number';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    var path = join(dbPath, DB_NAME);
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE $CONTACTS_TABLE('
          '$CONTACTS_ID INTEGER PRIMARY KEY, '
          '$CONTACTS_NAME TEXT, '
          '$CONTACTS_ACCOUNT_NUMBER INTEGER)');
    }, version: VERSION);
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[CONTACTS_NAME] = contact.name;
    contactMap[CONTACTS_ACCOUNT_NUMBER] = contact.accountNumber;
    return db.insert(CONTACTS_TABLE, contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query(CONTACTS_TABLE).then((maps) {
      final List<Contact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
            map[CONTACTS_ID], map[CONTACTS_NAME], map[CONTACTS_ACCOUNT_NUMBER]);
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
