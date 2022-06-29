library box_ui;

import 'dart:convert';
import 'dart:developer';

import 'package:box_ui/screens/header.dart';
import 'package:box_ui/screens/inpage.dart';
import 'package:box_ui/api/apiService.dart';
import 'package:box_ui/screens/slide.dart';
import 'package:box_ui/screens/sticky.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
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
  bool isClosed = true;

  var Render_ads_API =
      'https://api.afbrother.com/application/render_application_ads';
  var Impression_API = 'https://api.afbrother.com/creatives/app_ad_impression';

  BuildContext? get context => null;

  // Call AFBrother API
  Future<Object> _getAdsData() async {
    var url = Uri.parse(Render_ads_API);
    http.Response response =
        await http.post(url, body: {'appKey': appKey, 'adKey': adKey});

    var jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      Map.from(jsonResponse as Map<String, dynamic>);
    }
    return jsonResponse;
  }

  impressionAds(key) async {
    var url = Uri.parse(Impression_API);
    http.Response response = await http.post(url,
        body: {'adServerKey': key, 'appKey': appKey, 'adKey': adKey});
  }

  _getAdsByFormat(String banner_format, data) {
    switch (banner_format) {
      case "IN_PAGE":
        {
          return Inpage(data, isClosed);
        }
      case "STICKY":
        {
          return Sticky(data, isClosed);
        }
      case "SLIDE":
        {
          return Slide(data, isClosed);
        }
      default:
        {
          return Header(data, isClosed);
        }
    }
  }

  AFB({required this.appKey, required this.adKey})
      : assert(appKey != null),
        assert(adKey != null);

  @override
  Widget build(BuildContext context) {
    _getAdsData();
    return Container(
      child: FutureBuilder(
          future: _getAdsData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              impressionAds(snapshot.data['key']);
            }
            print(snapshot.data['key']);
            return snapshot.data != null
                ? _getAdsByFormat(snapshot.data['banner_format'], snapshot.data)
                : Text('No ads response');
          }),
    );
  }
}
