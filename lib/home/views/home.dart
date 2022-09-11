import 'package:cadence/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    ref.read(currentUserProvider);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final contacts = ref.watch(currentUserContactsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('This will be profile')),
              // );
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: contactListView(),
        ),
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
  var contacts = ['george', 'jorge', 'cece', 'john', 'james'];
  // final contacts = ref.watch(currentUserContactsProvider);
  Widget contactListView() {
    return ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5, // snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return contactListTile(contacts[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        });
  }

  Widget contactListTile(String contact) {
    return GestureDetector(
      child: ListTile(
        trailing: const Icon(Icons.person),
        title: Text(contact),
      ),
      onTap: () => Navigator.pushNamed(context, '/contact'),
    );
  }
}
