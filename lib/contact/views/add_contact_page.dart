import 'package:flutter/material.dart';

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
                    child: buildPhoneField()),
                Container(
                  padding: EdgeInsets.only(right: 21.0),
                  alignment: Alignment.centerRight,
                  child: buildSignInButton(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40.0),
                  alignment: Alignment.center,
                  child: buildForgotPasswordButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: contactCodeController,
        decoration: InputDecoration(
          labelText: "Paste Your Friend's Code",
        ),
      );

  Widget buildForgotPasswordButton() => TextButton(
      onPressed: () async {},
      child: Text("Copy My Code",
          style:
              TextStyle(fontSize: 16, decoration: TextDecoration.underline)));

  Widget buildSignInButton() => ElevatedButton(
      // Ternary operator to make disable button until all text fields are not null
      onPressed: () async {
        // String userId = await AuthService().login(
        //   phoneNumber: phoneController.text,
        //   password: passwordController.text,
        // );

        // if (userId != null && userId != "") {
        //   Provider.of<UserProvider>(context, listen: false).login(userId);

        //   // set login creds in shared prefs
        //   _prefs.then((SharedPreferences prefs) async {
        //     print("setstring on login");
        //     // prefs.setString('userId', '1');
        //     bool setStringSuccessful = await prefs.setString('userId', userId);

        //     print(
        //         "was set string successful? " + setStringSuccessful.toString());
        //   });

        Navigator.pushReplacementNamed(
          context,
          '/home',
        );
        // } else {
        //   setState(() {
        //     _error = true;
        //   });
        // }
        // print("in sign in page: " + userId);
      },
      child: Text("Add Friend"));
}
