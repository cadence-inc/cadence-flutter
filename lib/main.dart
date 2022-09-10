import 'package:cadence/auth/views/landing_page.dart';
import 'package:flutter/material.dart';

import 'auth/views/account_setup.dart';
import 'auth/views/verification_page.dart';
import 'contact/views/add_contact_page.dart';
import 'contact/views/contact_page.dart';
import 'home/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
