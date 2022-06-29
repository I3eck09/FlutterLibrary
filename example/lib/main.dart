import 'package:flutter/material.dart';
import 'package:box_ui/box_ui.dart';

// Footer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'AFBrother', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(
              'AFBrother App',
              style: const TextStyle(fontWeight: FontWeight.w200),
            )),
            body: Stack(
              children: <Widget>[
                Container(
                  child: const FooterPage(),
                ),
                // +++++++++++ Sticky and slide ads  ++++++++++++
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Slide
                      ],
                    ),
                    // Sticky
                  ],
                )
                // +++++++++++++++++++++++++++++++++++++++++++++++
              ],
            )));
  }
}

class FooterPage extends StatefulWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  FooterPageState createState() {
    return FooterPageState();
  }
}

class FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            const ListTile(title: Text('1')),
            const ListTile(title: Text('2')),
            const ListTile(title: Text('3')),
            const ListTile(title: Text('4')),
            // Inpage
            const ListTile(title: Text('5')),
            const ListTile(title: Text('6')),
            const ListTile(title: Text('7')),
            const ListTile(title: Text('8')),
          ],
        ),
      ),
    );
  }
}
