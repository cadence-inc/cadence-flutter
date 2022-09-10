import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: profilePic(),
                // child: const Icon(Icons.person),
              ),
            ),
            Expanded(
              child: contactInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget setCadence() {
    return Container(color: Colors.green);
  }

  Widget contactInfo() {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Name'),
            title: Text('Doug Dimadome'),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Cadence'),
            title: Text('2 months'),
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: setCadence());
              },
            ),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: Text('Birthday'),
            title: Text('ask your mom'),
          ),
          const Divider(color: Colors.black),
          ListTile(leading: Text('Location'), title: Text('your moms house'))
        ],
      ),
    );
  }

  Widget profilePic() {
    return Container(
      color: Colors.grey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          buildCallButton(),
        ],
      ),
    );
  }

  Widget buildCallButton() {
    return Positioned(
      left: 15,
      bottom: 20,
      child: Container(
        width: 310,
        // height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            FloatingActionButton(
              onPressed: null,
              child: Text(
                'hit up',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 100,
      left: 15,
      child: Container(
        child: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
