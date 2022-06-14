import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Slide extends StatefulWidget {
  final data;
  var isClosed;
  Slide(this.data, this.isClosed);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    void _launchUrl() async {
      // await launchUrl(_url);
      if (!await launchUrl(Uri.parse(widget.data['href'])))
        throw 'Could not launch ${widget.data['href']}';
    }

    void Closed() {
      setState(() {
        widget.isClosed = !widget.isClosed;
      });
    }

    return Positioned(
        right: 0.0,
        bottom: 0.0,
        child: Visibility(
            visible: widget.isClosed,
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
            )));
  }
}
