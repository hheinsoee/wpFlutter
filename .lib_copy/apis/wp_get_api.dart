import 'dart:convert';
import 'dart:developer';

import 'package:a/models/wp_get_model.dart';
import 'package:http/http.dart' as http;

postGetApi() async {
  final response = await http.get(Uri.parse('https://api.sarshay.com/wp'));

  if (response.statusCode == 200) {
    log(response.body);
    // return response.body;
    List<WpGetModel> wpList = [];
    var decodedData = jsonDecode(response.body);
    for (var i = 0; i < decodedData.length; i++) {
      wpList.add(WpGetModel(
          id: int.parse(decodedData[i]['id']),
          name: decodedData[i]["name"],
          description: decodedData[i]['description'],
          site_icon_url: decodedData[i]['site_icon_url']));
    }
    return wpList;
  } else {
    log("erroe");
    throw Exception('Failed to load album');
  }
}
