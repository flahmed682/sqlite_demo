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

  updatePerson(Person person) async {
    String sql = '''
       UPDATE PERSON SET 
       name = '${person.name}',
       age = ${person.age}
       WHERE 
       id = ${person.id}
    ''';
    int result = await update(sql);
    return result;
  }

  deletePerson(Person person) async {
    String sql = '''
       DELETE FROM PERSON
       WHERE 
       id = ${person.id}
    ''';
    int result = await update(sql);
    return result;
  }
}