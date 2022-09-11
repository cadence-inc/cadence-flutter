// import 'package:flownotes/auth/services/auth_service.dart';
// import 'package:flownotes/globals/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPage createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
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
                  padding: EdgeInsets.only(top: 60.0),
                  alignment: Alignment.topLeft,
                  child: buildBackButton(),
                ),
                Container(
                  // padding: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/cadence_logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
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
                        child: buildResendOTCButton(),
                      ),
                    ],
                  ),
                ),
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

  Widget buildBackButton() => IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      );

  Widget buildHeader(str) => Text(
        str,
        style: TextStyle(
          fontSize: 30,
        ),
      );

  Widget buildPhoneField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: phoneController,
        decoration: InputDecoration(
          labelText: "Paste Code from SMS",
        ),
      );

  Widget buildResendOTCButton() => TextButton(
        onPressed: () async {},
        child: Text(
          "Resend Code",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () async {
          Navigator.pushReplacementNamed(
            context,
            '/setup',
          );
        },
        child: Text("Verify"),
      );
}
