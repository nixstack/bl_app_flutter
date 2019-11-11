import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bl_app_flutter/model/HomeModel.dart';

const HOME_URL = 'https://jsonbox.io/box_72a33788e81e19d96a19/5dbb0208dd0a6500174fc5e2';
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return HomeModel.fromJson(result['data']);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
}
}