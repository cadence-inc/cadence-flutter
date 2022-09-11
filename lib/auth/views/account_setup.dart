import 'package:cadence/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: buildNameField(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: buildBirthdayField(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: buildCityField(),
            ),
            Container(
              padding: EdgeInsets.only(top: 14, right: 30.0),
              alignment: Alignment.centerRight,
              child: buildSignInButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNameField() => TextFormField(
        keyboardType: TextInputType.name,
        autofillHints: [AutofillHints.name],
        controller: nameController,
        decoration: InputDecoration(
          labelText: "What's your name?",
        ),
      );

  Widget buildBirthdayField() => TextFormField(
        keyboardType: TextInputType.datetime,
        autofillHints: [AutofillHints.birthday],
        controller: birthdayController,
        decoration: InputDecoration(
          hintText: 'MM/DD/YYYY',
          labelText: "What's your birthday?",
        ),
      );

  Widget buildCityField() => TextFormField(
        keyboardType: TextInputType.name,
        autofillHints: [AutofillHints.location],
        controller: cityController,
        decoration: InputDecoration(
          labelText: "What city do you live in?",
        ),
      );

  Widget buildSignInButton() => ElevatedButton(
        // Ternary operator to make disable button until all text fields are not null
        onPressed: () async {
          String cleanedBday = cleanBday(birthdayController.text);

          String uid = "80808080"; // todo: grab uid from provider
          bool result = await _authService.updateAccountInfo(
            uid,
            nameController.text,
            cleanedBday,
            cityController.text,
          );

          if (result) {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            );
          } else {
            print("updateAccountInfo Failed");
          }
        },
        child: Text("Yessir!"),
      );

  cleanBday(String rawBday) {
    List<String> elements = rawBday.split('/');

    var i = 0;
    var day = "";
    var month = "";
    var year = "";
    for (String e in elements) {
      if (i == 0) {
        month = e;
      }
      if (i == 1) {
        day = e;
      }
      if (i == 2) {
        year = e;
      }
      i += 1;
    }

    debugPrint("$year-$month-$day");
    return "$year-$month-$day";
  }
}
