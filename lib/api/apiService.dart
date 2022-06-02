import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

var url = Uri.parse(
    'https://api-afbrother.skuberg.pro/application/render_application_ads');

_ApiService(appKey, adKey) async {
  print('ApiService 1');
  http.Response response =
      await http.post(url, body: {'appKey': appKey, 'adKey': adKey});

  var jsonResponse = jsonDecode(response.body);

  if (response.statusCode == 200) {
    Map.from(jsonResponse as Map<String, dynamic>);
    return jsonResponse;
  } else {
    print('failed');
  }
}
