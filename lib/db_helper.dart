import 'package:sqlite_demo/litedb.dart';
import 'package:sqlite_demo/models/person.dart';

class DbHelper extends LiteDb {

  getAllPersons() async {
    List<Person> persons = [];
    String sql = "SELECT * FROM PERSON";
    List<Map> myMap = await inquiry(sql);
      for (int i = 0; i < myMap.length; i ++) {
        persons.add(Person.fromMap(myMap[i]));
      }
    return persons;
  }

  insertNewPerson(Person person) async {
    String sql = '''
       INSERT INTO PERSON(name, age)
       VALUES ( '${person.name}' , ${person.age})
    ''';
    int result = await insert(sql);
    return result;
  }
}