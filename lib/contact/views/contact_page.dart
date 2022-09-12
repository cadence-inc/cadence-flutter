import 'package:cadence/contact/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/contact_list_provider.dart';
import '../models/account_model.dart';
import '../models/contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final TextEditingController cadenceController = TextEditingController();
  final ContactService _contactService = ContactService();
  // AccountModel contactAccountInfo =  _contactService.getAccountInfoByUID(uid: contact.userId);

  @override
  Widget build(BuildContext context) {
    final List<int> args =
        ModalRoute.of(context)!.settings.arguments as List<int>;
    final int index = args[0];

    // contact provider
    final contacts =
        Provider.of<ContactListProvider>(context, listen: false).contacts;

    print("Cadence Interval on a contact" +
        contacts[index].cadence.interval.toString());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: profilePic(),
                // child: const Icon(Icons.person),
              ),
            ),
            Expanded(
              child: contactInfo(contacts[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget setCadence(ContactModel contact) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: buildCadenceField()),
        Container(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: buildCadenceSubmitButton(contact),
        ),
      ],
    );
  }

  Widget buildCadenceField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: cadenceController,
        decoration: InputDecoration(
          hintText: "5",
          suffixText: "months",
          labelText: "Set Your Cadence",
        ),
      );

  Widget buildCadenceSubmitButton(ContactModel contact) => ElevatedButton(
      // Ternary operator to make disable button until all text fields are not null
      onPressed: () async {
        await _contactService.setNewCadence(
            contactId: contact.contactId,
            newInterval: int.tryParse(cadenceController.text) ?? 300);
        Navigator.pop(context);
      },
      child: Text("Set Cadence"));

  Widget contactInfo(ContactModel contact) {
    // AccountModel contactAccountInfo =  _contactService.getAccountInfoByUID(uid: contact.userId);

    return GestureDetector(
      child: FutureBuilder<AccountModel>(
        future: _contactService.getAccountInfoByUID(uid: contact.connection[0]),
        builder: (BuildContext context, AsyncSnapshot<AccountModel> snapshot) {
          return snapshot.hasData
              ? Column(
                  children: <Widget>[
                    // const Divider(color: Colors.black),
                    ListTile(
                      // leading: Text('Name'),
                      title: Text('Name                   ${contact.name}'),
                    ),
                    const Divider(color: Colors.black),
                    ListTile(
                      // leading: Text('Name'),
                      title: Text(
                          'Next Meeting      ${contact.cadence.nextMeeting}'),
                    ),
                    const Divider(color: Colors.black),

                    ListTile(
                      title: Text(
                          'Cadence               ${contact.cadence.interval} months'),
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: setCadence(contact));
                        },
                      ),
                    ),
                    const Divider(color: Colors.black),
                    ListTile(
                      title: Text(
                          'Birthday                ${snapshot.data!.birthday}'),
                    ),
                    const Divider(color: Colors.black),
                    ListTile(
                        title: Text(
                            'City                        ${snapshot.data!.city}'))
                  ],
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget profilePic() {
    return Container(
      color: Colors.grey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://media.gq-magazine.co.uk/photos/5d13a9db3b385369a70e9964/master/pass/dave-hp-gq-26nov18_b.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(top: 60.0),
            alignment: Alignment.topLeft,
            child: buildBackButton(),
          ),
          buildTextButton(),
        ],
      ),
    );
  }

  Widget buildTextButton() {
    return Positioned(
      left: 15,
      bottom: 20,
      child: Container(
        width: 310,
        // height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            FloatingActionButton(
              onPressed: null,
              child: Text(
                'hit up',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBackButton() => IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      );

  // Widget buildBackButton() {
  //   return Positioned(
  //     top: 100,
  //     left: 15,
  //     child: Container(
  //       child: const FloatingActionButton(
  //         onPressed: null,
  //         child: Icon(Icons.arrow_back_ios),
  //       ),
  //     ),
  //   );
  // }
}
