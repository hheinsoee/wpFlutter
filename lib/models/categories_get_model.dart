import 'package:a/apis/get_api.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:localstorage/localstorage.dart';

class WPCatModel {
  int? id;
  String? name;
  String? slug;
  WPCatModel({required this.id, required this.name, required this.slug});
}

theWPCats(fetch, wpInfo, cb) async {
  var wpId = wpInfo.id;
  List<WPCatModel> wpCatsList = [];
  final LocalStorage wpCatsLocal = new LocalStorage('wpId_' + wpId.toString());
  if (wpCatsLocal.getItem('CatsList') != null && fetch == 'local') {
    var wpCatsListLocal = wpCatsLocal.getItem('CatsList');
    wpCatsListLocal.forEach((e) {
      wpCatsList.add(WPCatModel(id: e['id'], name: e['name'], slug: e['slug']));
    });

    log("Wp_" + wpId.toString() + " categories is loaded from local");
    cb(false, wpCatsList);

    // print(wpCatsListLocal.runtimeType);
    log("local load");
  } else {
    myGetApi(wpInfo.url + '/?rest_route=/wp/v2/categories', (err, apiData) {
      if (!err) {
        var decodedData = jsonDecode(apiData);

        var formatedList = decodedData.map((e) {
          return {'id': e['id'], 'name': e['name'], 'slug': e['slug']};
        }).toList();

        formatedList.forEach((e) {
          wpCatsList
              .add(WPCatModel(id: e['id'], name: e['name'], slug: e['slug']));
        });

        log("Wp_" + wpId.toString() + " categories is loaded from server");
        // print(formatedList.runtimeType);
        wpCatsLocal.setItem('CatsList', formatedList);
        cb(false, wpCatsList);
      } else {
        cb(err);
      }
    });
  }
}
