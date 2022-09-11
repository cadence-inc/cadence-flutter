// import 'package:flownotes/auth/services/auth_service.dart';
// import 'package:flownotes/globals/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  final TextEditingController phoneController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/cadence_logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 60, bottom: 30),
                    child: buildHeader('Welcome')),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: buildPhoneField()),
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: buildSubmitButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget Form Builder

  Widget buildHeader(str) => Text(str,
      style: TextStyle(
        fontSize: 30,
      ));

  Widget buildPhoneField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: phoneController,
        decoration: InputDecoration(
          labelText: "Can I get yo number?",
        ),
      );

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () async {
          Navigator.pushNamed(
            context,
            '/verification',
          );
        },
        child: Text("Yessir!"),
      );
}
