import 'package:flutter/material.dart';
import 'package:cadence/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final TextEditingController cadenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: contactInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget setCadence() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: buildCadenceField()),
        Container(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: buildCadenceSubmitButton(),
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

  Widget buildCadenceSubmitButton() => ElevatedButton(
      // Ternary operator to make disable button until all text fields are not null
      onPressed: () async {
        Navigator.pop(context);
      },
      child: Text("Set Cadence"));

  Widget contactInfo() {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Name'),
            title: Text('Doug Dimadome'),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Cadence'),
            title: Text('2 months'),
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: setCadence());
              },
            ),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Birthday'),
            title: Text('ask your mom'),
          ),
          const Divider(color: Colors.black),
          ListTile(leading: Text('Location'), title: Text('your moms house'))
        ],
      ),
    );
  }

  Widget profilePic() {
    return Container(
      color: Colors.grey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0),
            alignment: Alignment.topLeft,
            child: buildBackButton(),
          ),
          buildCallButton(),
        ],
      ),
    );
  }

  Widget buildCallButton() {
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
