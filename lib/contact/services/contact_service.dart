import 'package:cadence/models/contact_model.dart';

class ContactService {
  Future<List<ContactModel>> getAllContacts({required userId}) async {
    // final response = await http.get(
    //   Uri.parse('https://api.flownotes.io/notes/$userId'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );
    // if (response.statusCode == 200) {
    //   try {
    //     List<dynamic> notes = json.decode(response.body);
    //     return notes.map((note) => NoteModel.fromJson(note)).toList();
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // }
    // print(response.statusCode);
    // print(response.body);
    var contact1 = ContactModel(name: "John Doe", cadence: '3');
    var contact2 = ContactModel(name: "Jane Doe", cadence: '6');
    var contact3 = ContactModel(name: "Joe Doe", cadence: '9');
    var contact4 = ContactModel(name: "Jill Doe", cadence: '12');
    var contact5 = ContactModel(name: "Jack Doe", cadence: '15');
    var contact6 = ContactModel(name: "Joseph Doe", cadence: '18');
    var contact7 = ContactModel(name: "Jen Doe", cadence: '21');
    return [
      contact1,
      contact2,
      contact3,
      contact4,
      contact5,
      contact6,
      contact7
    ];
  }
}
