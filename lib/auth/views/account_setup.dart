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
              padding: EdgeInsets.only(
                top: 60,
              ),
              child: buildSignInButton(),
            ),
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

    print(year + "-" + month + "-" + day);
    return year + "-" + month + "-" + day;
  }
}
