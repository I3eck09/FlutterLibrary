import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Inpage extends StatefulWidget {
  final data;
  var isClosed;
  // ignore: use_key_in_widget_constructors
  Inpage(this.data, this.isClosed);

  @override
  State<Inpage> createState() => _InpageState();
}

class _InpageState extends State<Inpage> {
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
    return Visibility(
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
                    'https://api.afbrother.com/api/serverImage/close.png',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
