library box_ui;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

typedef ShadeBuilder = Widget Function(
    BuildContext context, String text, Color color);

class ShadedText extends StatelessWidget {
  final String appKey;
  final String adKey;
  var adsData = <String, dynamic>{};
  var imgUrl =
      'https://api-afbrother.skuberg.pro/creatives/display/b63c7f02-7020-4f04-a5ee-620c63f740b4';

  getData() async {
    var url = Uri.parse(
        'https://api-afbrother.skuberg.pro/application/render_application_ads');
    http.Response response =
        await http.post(url, body: {'appKey': appKey, 'adKey': adKey});

    var jsonResponse = jsonDecode(response.body);
    var eiei2 = [];
    var eiei;

    if (response.statusCode == 200) {
      Map.from(jsonResponse as Map<String, dynamic>);
      print(jsonResponse.runtimeType);
      print(jsonResponse);
      imgUrl = jsonResponse['url'];
      eiei = jsonResponse['url'];
    } else {
      print('failed');
    }
    return eiei;
  }

  ShadedText({required this.appKey, required this.adKey})
      : assert(appKey != null),
        assert(adKey != null);

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
        title: appKey,
        home: Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(
                              'https://i.pinimg.com/474x/58/bd/84/58bd84fe90617dfc1bc32eb5e8643367.jpg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          // body: Container(
          //   padding: const EdgeInsets.all(12),
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: 300.0,
          //     height: 500.0,
          //     decoration: BoxDecoration(
          //         // borderRadius: BorderRadius.circular(30.0),
          //         image: const DecorationImage(
          //             image: NetworkImage(
          //               "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
          //             ),
          //             fit: BoxFit.cover)),
          //     child: Container(
          //       decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: NetworkImage(
          //                   'https://i.pinimg.com/474x/58/bd/84/58bd84fe90617dfc1bc32eb5e8643367.jpg'),
          //               opacity: 0.4,
          //               scale: 9,
          //               alignment: Alignment.topLeft)),
          //     ),
          //   ),
          // ),
        ));
  }
}
