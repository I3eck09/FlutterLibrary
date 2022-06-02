import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _redirectUrl = Uri.parse(
    'https://api-afbrother.skuberg.pro/creatives/mobile/ad_click?adKey=6zryzgjyd&appKey=1cgrvuwao');

class Inpage extends StatefulWidget {
  final String data;
  const Inpage(this.data, {String? imgUrl});

  @override
  State<Inpage> createState() => _InpageState();
}

class _InpageState extends State<Inpage> {
  var inpage =
      'https://api-afbrother.skuberg.pro/creatives/display/b63c7f02-7020-4f04-a5ee-620c63f740b4';
  var sticky =
      'https://api-afbrother.skuberg.pro/creatives/display/b2d4da70-1fac-4c26-a431-8a8daf9c8170';
  bool isClosed = false;

  void _launchUrl() async {
    print(_redirectUrl);
    // await launchUrl(_url);
    if (!await launchUrl(_redirectUrl)) throw 'Could not launch $_redirectUrl';
  }

  void Closed() {
    setState(() {
      isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('data' + widget.data);
    return Scaffold(
      body: !isClosed
          ? Material(
              child: GestureDetector(
              onTap: () {
                _launchUrl();
              },
              child: Stack(
                children: <Widget>[
                  // Image.network(testUrl),
                  Container(
                    child: Image.network(widget.data),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topLeft,
                    color: Colors.white.withOpacity(0.1),
                    child: GestureDetector(
                      onTap: () {
                        Closed();
                      },
                      child: Image.network(
                        'https://api-afbrother.skuberg.pro/api/serverImage/close.png',
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //     onPressed: () {
                  //       print('Closed');
                  //     },
                  //     child: Image.network(
                  //       'https://api-afbrother.skuberg.pro/api/serverImage/close.png',
                  //     ),
                  //     ),
                ],
              ),
            ))
          : Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isClosed = false;
                    });
                  },
                  icon: Icon(Icons.egg)),
            ),
    );
  }
}
