import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:box_ui/box_ui.dart';

// Footer
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'AFBrother', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return SafeArea(
        child: Scaffold(
      body: FooterPage(),
      bottomNavigationBar: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topRight,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: AFB(
                  appKey: '1cgrvuwao',
                  adKey: 'rscztoaic',
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: AFB(
                  appKey: '1cgrvuwao',
                  adKey: 'oyto7vgtt',
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}

class FooterPage extends StatefulWidget {
  @override
  FooterPageState createState() {
    return new FooterPageState();
  }
}

class FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text(
        'Flutter Footer View',
        style: TextStyle(fontWeight: FontWeight.w200),
      )),
      drawer: new Drawer(),
      body: Container(
        child: AFB(
          appKey: '1cgrvuwao',
          adKey: 'd3k4m8hqf',
        ),

        // Column(
        //   children: [
        //     AFB(
        //        // Header
        //       appKey: '1cgrvuwao',
        //       adKey: 'rp4abc2qg',
        //     ),
        //     AFB(
        //        // In-page
        //       appKey: '1cgrvuwao',
        //       adKey: 'd3k4m8hqf',
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 10.0,
          child: new Icon(Icons.chat),
          backgroundColor: Color(0xFF162A49),
          onPressed: () {}),
    );
  }
}
