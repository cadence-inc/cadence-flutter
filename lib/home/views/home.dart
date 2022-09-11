import 'package:cadence/auth/services/auth_service.dart';
import 'package:cadence/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contact/models/contact_model.dart';
import '../../providers/contact_list_provider.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    // ref.read(currentUserProvider);
  }

  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(currentUserProvider);
    // final contacts = ref.watch(currentUserContactsProvider);
    final user = Provider.of<UserProvider>(context, listen: false).userId;
    final contacts =
        Provider.of<ContactListProvider>(context, listen: false).contacts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadence Beta'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('This will be profile')),
              // );
              _authService.signOut();
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: Container(
        child: contactListView(contacts),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }

  // grab the contacts and generate a list view composed of list tiles
  // var contacts = ['george', 'jorge', 'cece', 'john', 'james'];
  // final contacts = ref.watch(currentUserContactsProvider);
  Widget contactListView(List<ContactModel> contacts) {
    return ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length, // snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return contactListTile(contacts[index], index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        });
  }

  Widget contactListTile(ContactModel contact, int index) {
    return GestureDetector(
      child: ListTile(
        trailing: const Icon(Icons.person),
        title: Text(contact.name),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        '/contact',
        arguments: [index],
      ),
    );
  }
}
