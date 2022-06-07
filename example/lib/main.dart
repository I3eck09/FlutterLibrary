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
        title: const Text('Test'),
      ),
      body: FooterPage(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                // margin: const EdgeInsets.only(bottom: 10.0),
                width: 50,
                // color: Colors.red,
                alignment: Alignment.topRight,
                // decoration: BoxDecoration(color: Colors.lightBlue),
                child: AFB(
                  appKey: '1cgrvuwao',
                  adKey: 'rscztoaic',
                ),
              ),
            ],
          ),
          // AFB(
          //   appKey: '1cgrvuwao',
          //   adKey: 'oyto7vgtt',
          // ),
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
      ),
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
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            Container(
              child: BannerHeader(),
            ),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            Container(
              child: BannerInpage(),
            ),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot)),
            ListTile(title: Icon(Icons.battery_full)),
            ListTile(title: Icon(Icons.anchor)),
            ListTile(title: Icon(Icons.access_alarm)),
            ListTile(title: Icon(Icons.ballot))
          ],
        ),
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
      floatingActionButton: new FloatingActionButton(
          elevation: 10.0,
          child: new Icon(Icons.chat),
          backgroundColor: Color(0xFF162A49),
          onPressed: () {}),
    );
  }
}

class BannerHeader extends StatefulWidget {
  const BannerHeader({Key? key}) : super(key: key);

  @override
  State<BannerHeader> createState() => _BannerHeaderState();
}

class _BannerHeaderState extends State<BannerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        child: AFB(
          // Header
          appKey: '1cgrvuwao',
          adKey: 'rp4abc2qg',
        ));
  }
}

class BannerInpage extends StatefulWidget {
  const BannerInpage({Key? key}) : super(key: key);

  @override
  State<BannerInpage> createState() => _BannerInpageState();
}

class _BannerInpageState extends State<BannerInpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AFB(
        // In-page
        appKey: '1cgrvuwao',
        adKey: 'd3k4m8hqf',
      ),
    );
  }
}


// Image.network(
            // 'https://api-afbrother.skuberg.pro/creatives/display/b63c7f02-7020-4f04-a5ee-620c63f740b4'));
