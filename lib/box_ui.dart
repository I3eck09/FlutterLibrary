library box_ui;

import 'dart:convert';

import 'package:box_ui/screens/inpage.dart';
import 'package:box_ui/api/apiService.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
// Call Api
import 'package:http/http.dart' as http;
// Url launcher (Redirect)
import 'package:url_launcher/url_launcher.dart';
// Footer
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

typedef ShadeBuilder = Widget Function(
    BuildContext context, String text, Color color);

class AFB extends StatelessWidget {
  final String appKey;
  final String adKey;
  var imgUrl = '';

  var ImUrl = 'https://api-afbrother.skuberg.pro/creatives/app_ad_impression';

  // Call AFBrother API
  Future<String> _getAdsData() async {
    var url = Uri.parse(
        'https://api-afbrother.skuberg.pro/application/render_application_ads');
    http.Response response =
        await http.post(url, body: {'appKey': appKey, 'adKey': adKey});

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Map.from(jsonResponse as Map<String, dynamic>);
      imgUrl = jsonResponse['url'];
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

  _getAdsByFormat(value) {
    print('value' + value);
  }

  AFB({required this.appKey, required this.adKey})
      : assert(appKey != null),
        assert(adKey != null);

  @override
  Widget build(BuildContext context) {
    _getAdsData();
    return new Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _getAdsData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                impressionAds();
              }
              return Inpage(snapshot.data);
            }),
      ),
    );
  }
}
