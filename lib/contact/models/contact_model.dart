import 'package:cadence/contact/models/cadence_model.dart';

class ContactModel {
  final String name;
  final String contactId;
  final CadenceModel cadence;
  final List<String> connection;
  final int dateAdded;
  final bool isDeleted;

  ContactModel({
    required this.name,
    required this.cadence,
    required this.contactId,
    required this.connection,
    required this.dateAdded,
    required this.isDeleted,
  });
}
