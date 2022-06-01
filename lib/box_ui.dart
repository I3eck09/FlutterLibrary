library box_ui;

import 'dart:convert';

import 'package:box_ui/screens/inpage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

typedef ShadeBuilder = Widget Function(
    BuildContext context, String text, Color color);

class AFB extends StatelessWidget {
  final String appKey;
  final String adKey;
  var imgUrl = '';

  var ImUrl = 'https://api-afbrother.skuberg.pro/creatives/app_ad_impression';

  // Call AFBrother API
  Future<String> _getAdsData() async {
    print(1);
    var url = Uri.parse(
        'https://api-afbrother.skuberg.pro/application/render_application_ads');
    http.Response response =
        await http.post(url, body: {'appKey': appKey, 'adKey': adKey});

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Map.from(jsonResponse as Map<String, dynamic>);
      imgUrl = jsonResponse['url'];
      print(2);
    } else {
      print('failed');
    }
    return jsonResponse['url'];
  }

  impressionAds() async {
    var url = Uri.parse(
        'https://api-afbrother.skuberg.pro/creatives/app_ad_impression');
    http.Response response = await http.post(url,
        body: {'adServerKey': '6zryzgjyd', 'appKey': appKey, 'adKey': adKey});
  }

  AFB({required this.appKey, required this.adKey})
      : assert(appKey != null),
        assert(adKey != null);

  @override
  Widget build(BuildContext context) {
    _getAdsData();

    impressionAds();
    // ignore: unnecessary_new
    return new Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _getAdsData(),
            builder: (context, AsyncSnapshot snapshot) {
              return new Image.network(
                  'https://i.pinimg.com/474x/58/bd/84/58bd84fe90617dfc1bc32eb5e8643367.jpg');
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const CircularProgressIndicator.adaptive();
              // }
              // if (snapshot.hasError) {
              //   return Text(snapshot.error.toString());
              // } else {
              //   return Container(
              //     child: Inpage(),
              //   );
              // }
              print(snapshot);
              return Image.network(snapshot.data);
            }),
      ),
      // title: appKey,
      // home: const Inpage(),
      // home:
    );
  }
}
