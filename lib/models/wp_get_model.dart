import 'package:a/apis/get_api.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:localstorage/localstorage.dart';

class WPModel {
  int? id;
  String? name, description, site_icon_url, color_hue, url;

  WPModel(
      {required this.id,
      required this.name,
      required this.description,
      this.color_hue,
      this.url,
      required this.site_icon_url});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': this.id,
  //     'name': this.name,
  //     'description': this.description,
  //     'site_icon_url': this.color_hue,
  //     'ur': this.url,
  //     'color_hue': this.site_icon_url
  //   };
  // }

  // static dynamic getListMap(List<dynamic> items) {
  //   if (items == null) {
  //     return null;
  //   }
  //   List<Map<String, dynamic>> list = [];
  //   items.forEach((element) {
  //     list.add(element.toMap());
  //   });
  //   return list;
  // }
}

wpList(fetch, cb) async {
  List<WPModel> wpList = [];
  final LocalStorage wpLocal = new LocalStorage('WP');

  if (wpLocal.getItem('wpList') != null && fetch == 'local') {
    var localWp = wpLocal.getItem('wpList');
    // log(localWp.toString());
    localWp.forEach((e) {
      wpList.add(WPModel(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        site_icon_url: e['site_icon_url'],
        url: e['url'],
        color_hue: e['color_hue'],
      ));
    });
    log("loaded from Local");
    cb(false, wpList);
  } else {
    myGetApi('https://api.sarshay.com/wp', (err, apiData) {
      if (!err) {
        var decodedData = jsonDecode(apiData);

        var formatedList = decodedData.map((e) {
          return {
            'id': int.parse(e['id']),
            'name': e['name'],
            'description': e['description'],
            'site_icon_url': e['site_icon_url'],
            'url': e['url'],
            'color_hue': e['color_hue']
          };
        }).toList();

        formatedList.forEach((e) {
          wpList.add(WPModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            site_icon_url: e['site_icon_url'],
            url: e['url'],
            color_hue: e['color_hue'],
          ));
        });

        log("loaded from server");
        // log(json.encode(formatedList));
        wpLocal.setItem('wpList', formatedList);

        cb(false, wpList);
      } else {
        cb(err);
      }
    });
  }
}
