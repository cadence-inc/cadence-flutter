import 'package:cadence/contact/models/cadence_model.dart';
import 'package:cadence/contact/models/contact_model.dart';

import '../models/account_model.dart';

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
    var contact1 = ContactModel(
        contactId: "2",
        name: "John Doe",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact2 = ContactModel(
        contactId: "2",
        name: "Jane Doe",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact3 = ContactModel(
        contactId: "2",
        name: "John Smith",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact4 = ContactModel(
        contactId: "2",
        name: "Jane Smith",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact5 = ContactModel(
        name: "John Doe",
        contactId: "2",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact6 = ContactModel(
        contactId: "2",
        name: "Jane Doe",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

    var contact7 = ContactModel(
        contactId: "2",
        name: "John Smith",
        cadence: CadenceModel(
          dateAdded: 123123,
          interval: 5,
          isDeleted: false,
          mostRecentMeeting: '07/11/2022',
          nextMeeting: '12/12/2022',
        ),
        connection: ["1", "2"],
        dateAdded: 123456789,
        isDeleted: false);

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

  Future<bool> setNewCadence(
      {required String contactId, required int newInterval}) async {
    print("setNewCadence: $contactId, $newInterval");

    return true;
  }

  // add new contact
  Future<bool> createNewContact(
      {required String userId1, required String userId2}) async {
    print("createNewContact: $userId1, $userId2");

    return true;
  }

  // getAccountInfoByUID
  Future<AccountModel> getAccountInfoByUID({required String uid}) async {
    print("getAccountInfoByUID: $uid");

    return AccountModel(
      name: "John Doe",
      birthday: "01/01/2000",
      city: "New York",
      phoneNumber: "123-456-7890",
      userId: "82828282",
      isDeleted: false,
    );
  }
}
