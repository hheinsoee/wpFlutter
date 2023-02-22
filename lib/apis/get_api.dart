import 'dart:developer';
import 'package:http/http.dart' as http;

myGetApi(url, cb) async {
  log("get -> " + url);
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // log(response.body);
    cb(false, response.body);
  } else {
    cb(true);
    log("error on");
    throw Exception('Failed to load album');
  }
}
