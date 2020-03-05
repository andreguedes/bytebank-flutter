import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const VERSION = 1;
const DB_NAME = 'bytebank.db';
const CONTACTS_TABLE = 'contacts';
const CONTACT_ID = 'id';
const CONTACT_NAME = 'name';
const CONTACT_ACCOUNT_NUMBER = 'account_number';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    var path = join(dbPath, DB_NAME);
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE $CONTACTS_TABLE('
            '$CONTACT_ID INTEGER PRIMARY KEY, '
            '$CONTACT_NAME TEXT, '
            '$CONTACT_ACCOUNT_NUMBER INTEGER)');
      },
      version: VERSION,
//      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[CONTACT_NAME] = contact.name;
    contactMap[CONTACT_ACCOUNT_NUMBER] = contact.accountNumber;
    return db.insert(CONTACTS_TABLE, contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query(CONTACTS_TABLE).then((maps) {
      final List<Contact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
            map[CONTACT_ID], map[CONTACT_NAME], map[CONTACT_ACCOUNT_NUMBER]);
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
