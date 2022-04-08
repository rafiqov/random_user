
import 'package:get/get.dart';

import '../models/user_model.dart';

class Network extends GetConnect {
  static bool isTester = true;
  static String serverDevelopment = 'https://randomuser.me';
  static String serverProduction = 'https://randomuser.me';

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  static String getServer() {
    return isTester ? serverDevelopment : serverProduction;
  }

  Future<Map<String, dynamic>> GET(
      String api, Map<String, dynamic> params) async {
    var response =
        await get(getServer() + api, headers: getHeaders(), query: params);
    return response.statusCode == 200 ? response.body : null;
  }

  Future<Map<String, dynamic>?> POST(
      String api, Map<String, dynamic> params) async {
    var response = await post(getServer() + api, params, headers: getHeaders());
    return (response.statusCode == 200 || response.statusCode == 201)
        ? response.body
        : null;
  }

  Future<dynamic> PUT(String api, Map<String, dynamic> params) async {
    var response = await put(getServer() + api, params, headers: getHeaders());
    return (response.statusCode == 200) ? response.body : null;
  }

  Future<Map<String, dynamic>?> DEL(
      String api, Map<String, dynamic> params) async {
    var response =
        await delete(getServer() + api, headers: getHeaders(), query: params);
    return (response.statusCode == 200) ? response.body : null;
  }

  /* Http Apis*/
  String apiList = '/api/';

  /* Http Params */

  Map<String, String> paramsEmpty() {
    Map<String, String> params = {'nat': 'us', 'results': '10'};
    return params;
  }
  Map<String, String> paramsSearch(String search) {
    Map<String, String> params = {'nat': search, 'results': '10'};
    return params;
  }

  /* Http Parse */
  List<User> parseUserList(json) {
    List<User> list = [];
    Map<String, dynamic> results = json;
    for (var item in results["results"]) {
      list.add(User.fromJson(item));
      Get.log(list.last.picture!.medium.toString());
    }

    return list;
  }
}
