import 'package:cadence/contact/models/contact_model.dart';
import 'package:cadence/contact/services/contact_service.dart';
import 'package:flutter/material.dart';

class ContactListProvider extends ChangeNotifier {
  List<ContactModel> _contacts = [];

  final ContactService _contactService = ContactService();

  List<ContactModel> get contacts => _contacts;
  int get length => _contacts.length;

  Future<void> getContacts(userId) async {
    // currentSearchQuery = '';
    _contacts = await _contactService.getAllContacts(userId: userId);
    print("contacts returned by service: " + _contacts.toString());
    print(_contacts);
    notifyListeners();
  }

  // Future<void> searchNotes(userId, query) async {
  //   currentSearchQuery = query;
  //   _notes = await NoteService().searchNotes(userId: userId, query: query);
  //   notifyListeners();
  // }

  // add a stream

  // void addNote(NoteModel note) {
  //   _notes.add(note);
  //   notifyListeners();
  // }

  // void removeNote(NoteModel note) {
  //   _notes.remove(note);
  //   notifyListeners();
  // }
}
