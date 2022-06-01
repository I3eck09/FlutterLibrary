import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://api-afbrother.skuberg.pro/creatives/mobile/ad_click?adKey=6zryzgjyd&appKey=1cgrvuwao');

class Inpage extends StatefulWidget {
  const Inpage({String? imgUrl});

  @override
  State<Inpage> createState() => _InpageState();
}

class _InpageState extends State<Inpage> {
  var testUrl =
      'https://api-afbrother.skuberg.pro/creatives/display/b63c7f02-7020-4f04-a5ee-620c63f740b4';
  bool isClosed = false;

  void _launchUrl() async {
    print(_url);
    // await launchUrl(_url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
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
                  Container(
                    child: Image.network(testUrl),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                        color: Colors.grey, shape: CircleBorder()),
                    child: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.white,
                      iconSize: 50,
                      splashRadius: 40,
                      disabledColor: Colors.grey,
                      onPressed: () {
                        Closed();
                      },
                      tooltip: "Play",
                    ),
                  )

                  //   IconButton(
                  //   color: Colors.blue,
                  //   icon: const Icon(
                  //     Icons.volume_down,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () {
                  //     print('object');
                  //   },
                  //   //     child: ElevatedButton(
                  //   //   onPressed: () {
                  //   //     Closed();
                  //   //     // print('Close');
                  //   //   },
                  //   //   child: Container(
                  //   //     decoration: const BoxDecoration(
                  //   //         image: DecorationImage(
                  //   //             image: NetworkImage(
                  //   //                 'https://i.pinimg.com/474x/58/bd/84/58bd84fe90617dfc1bc32eb5e8643367.jpg'),
                  //   //             opacity: 0.4,
                  //   //             scale: 1,
                  //   //             alignment: Alignment.topLeft)),
                  //   //   ),
                  //   // )
                  // )
                ],
                // width: 200.0,
                // height: 200.0,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: NetworkImage(testUrl), fit: BoxFit.cover)),
              ),
            ))
          : Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isClosed = false;
                    });
                  },
                  icon: Icon(Icons.volume_down)),
            ),
    );
  }
}
