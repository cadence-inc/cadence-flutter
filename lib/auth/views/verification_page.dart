// import 'package:flownotes/auth/services/auth_service.dart';
// import 'package:flownotes/globals/providers/user_provider.dart';
import 'package:cadence/auth/services/auth_service.dart';
import 'package:cadence/providers/contact_list_provider.dart';
import 'package:cadence/providers/user_provider.dart';
import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class VerificationPage extends StatefulWidget {
  String oneTimeCode = '';

  VerificationPage({
    Key? key,
    // required this.phoneNumber, required this.oneTimeCode
  }) : super(key: key);

  @override
  _VerificationPage createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
  final TextEditingController oneTimeCodeController = TextEditingController();

  final AuthService _authService = AuthService();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final List<String> args =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final String phoneNumber = args[0];
    widget.oneTimeCode = args[1];

    // print("phoneNumber" + phoneNumber);
    // print("oneTimeCode: " + widget.oneTimeCode);

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
                          child: buildOneTimeCodeField()),
                      Container(
                        padding: EdgeInsets.only(right: 21.0),
                        alignment: Alignment.centerRight,
                        child: buildResendOTCButton(phoneNumber),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: buildSubmitButton(widget.oneTimeCode, phoneNumber),
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

  Widget buildOneTimeCodeField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: oneTimeCodeController,
        decoration: InputDecoration(
          labelText: "Paste Code from SMS",
        ),
      );

  Widget buildResendOTCButton(String phoneNumber) => TextButton(
        onPressed: () async {
          String newOneTimeCode =
              await _authService.sendOTC(phoneNumber: phoneNumber);
          setState(() {
            widget.oneTimeCode = newOneTimeCode;
          });
          print("newOneTimeCode: " + newOneTimeCode);
        },
        child: Text(
          "Resend Code",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );

  Widget buildSubmitButton(String oneTimeCode, String phoneNumber) =>
      ElevatedButton(
        onPressed: () async {
          // check if user submitted correct code
          var res = [];
          if (oneTimeCode == oneTimeCodeController.text) {
            res = await _authService.oneTimeCodeVerified(
                phoneNumber: phoneNumber) as List;
          } else {
            throw ("oneTimeCode Incorrect");
          }

          bool isNewUser = res[0];
          String userId = res[1];

          // set user in provider
          // Provider.of<UserProvider>(context, listen: false).setUser(userId);
          // final uid = ref.read(currentUserProvider);
          // ref.read(currentUserProvider.notifier).setUser('iojiojoj');
          Provider.of<UserProvider>(context, listen: false).setUserId(userId);

          Provider.of<ContactListProvider>(context, listen: false)
              .getContacts(userId);

          // set userID in shared preferences

          _prefs.then((SharedPreferences prefs) async {
            print("setstring on verification");

            bool setStringSuccessful = await prefs.setString('userId', userId);

            print(
                "was set string successful? " + setStringSuccessful.toString());
          });

          if (isNewUser) {
            Navigator.pushReplacementNamed(
              context,
              '/setup',
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            );
          }
        },
        child: Text("Verify"),
      );
}
