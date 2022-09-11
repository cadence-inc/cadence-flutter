import 'package:cadence/contact/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController contactCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friend'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 60, bottom: 30),
              child: Container()),
          Container(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: buildContactCodeField()),
                Container(
                  padding: EdgeInsets.only(right: 30.0),
                  alignment: Alignment.centerRight,
                  child: buildSubmitButton(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40.0),
                  alignment: Alignment.center,
                  child: buildCopyMyCodeButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactCodeField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: contactCodeController,
        decoration: InputDecoration(
          labelText: "Paste Your Friend's Code",
        ),
      );

  Widget buildCopyMyCodeButton() => TextButton(
      onPressed: () async {
        final user = Provider.of<UserProvider>(context, listen: false).userId;
        Clipboard.setData(ClipboardData(text: user));
      },
      child: Text("Copy My Code",
          style:
              TextStyle(fontSize: 16, decoration: TextDecoration.underline)));

  Widget buildSubmitButton() => ElevatedButton(

      // Ternary operator to make disable button until all text fields are not null
      onPressed: () async {
        final ContactService _contactService = ContactService();
        final currentUserId =
            Provider.of<UserProvider>(context, listen: false).userId;
        var res = await _contactService.createNewContact(
            userId1: contactCodeController.text, userId2: currentUserId);

        if (res == true) {
          Navigator.pushReplacementNamed(
            context,
            '/home',
          );
        } else {
          print("error creating new contact!");
        }
        // } else {
        //   setState(() {
        //     _error = true;
        //   });
        // }
        // print("in sign in page: " + userId);
      },
      child: Text("Add Friend"));
}
