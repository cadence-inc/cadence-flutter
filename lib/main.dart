import 'package:cadence/auth/views/landing_page.dart';
import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth/views/account_setup.dart';
import 'auth/views/verification_page.dart';
import 'contact/views/add_contact_page.dart';
import 'contact/views/contact_page.dart';
import 'home/views/home.dart';
import 'models/contact_model.dart';

final currentUserProvider = Provider((ref) => '123abc');
final currentUserContactsProvider = Provider((ref) => [
      ContactModel(name: 'adam', cadence: '2m'),
      ContactModel(name: 'kelly', cadence: '1m'),
      ContactModel(name: 'joey', cadence: '6m'),
      ContactModel(name: 'abby', cadence: '5m'),
      ContactModel(name: 'maurice', cadence: '9m'),
    ]);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LandingPage(),
        '/home': (context) => const HomePage(),
        '/verification': (context) => VerificationPage(),
        '/setup': (context) => const AccountSetupPage(),
        '/add': (context) => const AddContactPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
    // home: const HomePage(),
  }
}
