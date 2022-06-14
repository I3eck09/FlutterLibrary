import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Sticky extends StatefulWidget {
  final data;
  var isClosed;
  Sticky(this.data, this.isClosed);

  @override
  State<Sticky> createState() => _StickyState();
}

class _StickyState extends State<Sticky> {
  double setHeightByScale() {
    var adsWidth = widget.data['width'];
    var adsHeight = widget.data['height'];

    var scrWidth = MediaQuery.of(context).size.width;

    var heightScale = (scrWidth / adsWidth) * adsHeight;
    print(adsHeight.toString() + ' ' + heightScale.toString());
    return heightScale.toDouble();
  }

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

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                      width: MediaQuery.of(context).size.width,
                      height: setHeightByScale(),
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
