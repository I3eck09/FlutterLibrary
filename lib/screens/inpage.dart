import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Inpage extends StatefulWidget {
  final data;
  const Inpage(this.data);

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
    // await launchUrl(_url);
    if (!await launchUrl(Uri.parse(widget.data['href'])))
      throw 'Could not launch ${widget.data['href']}';
  }

  void Closed() {
    setState(() {
      isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    // margin: const EdgeInsets.only(top: 500.0),
                    child: Image.network(
                      widget.data['url'],
                      width: widget.data['width'].toDouble(),
                      height: widget.data['height'].toDouble(),
                    ),
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
