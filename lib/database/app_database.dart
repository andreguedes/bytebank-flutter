import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const VERSION = 1;
const DB_NAME = 'bytebank.db';
const CONTACTS_TABLE = 'contacts';
const CONTACT_ID = 'id';
const CONTACT_NAME = 'name';
const CONTACT_ACCOUNT_NUMBER = 'account_number';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), DB_NAME);
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
}

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap[CONTACT_NAME] = contact.name;
  contactMap[CONTACT_ACCOUNT_NUMBER] = contact.accountNumber;
  return db.insert(CONTACTS_TABLE, contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query(CONTACTS_TABLE);
  final List<Contact> contacts = List();
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row[CONTACT_ID],
      row[CONTACT_NAME],
      row[CONTACT_ACCOUNT_NUMBER],
    );
    contacts.add(contact);
  }
  return contacts;
}
