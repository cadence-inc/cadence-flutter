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
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _error = false;

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
                    padding: EdgeInsets.only(top: 60, bottom: 30),
                    child: buildHeader('Verify')),
                Container(
                    child: Column(children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: buildPhoneField()),
                  Container(
                    padding: EdgeInsets.only(right: 21.0),
                    alignment: Alignment.centerRight,
                    child: buildForgotPasswordButton(),
                  ),
                ])),
                Container(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: buildSignInButton(),
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
          Navigator.pushReplacementNamed(context, '/');
        },
      );

  Widget buildHeader(str) => Text(str,
      style: TextStyle(
        fontSize: 30,
      ));

  Widget buildPhoneField() => TextFormField(
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        controller: phoneController,
        decoration: InputDecoration(
          labelText: "Code sent to your phone",
        ),
      );

  Widget buildPasswordField() => TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        controller: passwordController,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                  print(_passwordVisible);
                });
              }),
        ),
      );

  Widget buildForgotPasswordButton() => TextButton(
      onPressed: () async {
        Navigator.pushNamed(context, '/resetPassword');
      },
      child: Text("Resend Code",
          style: TextStyle(decoration: TextDecoration.underline)));

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
      child: Text("Sign in"));

  Widget incorrectUserPass() {
    if (_error) {
      return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(29.0, 8.0, 0.0, 0.0),
          child: Text('Incorrect phone/username and password combination.',
              style: TextStyle(color: Colors.red)));
    }
    return SizedBox(height: 0);
  }
}
