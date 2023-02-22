import 'package:a/apis/get_api.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:localstorage/localstorage.dart';

class WPPostModel {
  int? id;
  int? wpid;
  String? title;
  String? excerpt;
  String? content;
  String? date;
  List? categories;
  String? image;
  WPPostModel({
    required this.id,
    required this.wpid,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.date,
    required this.categories,
    // required this.image,
  });
}

wpPostList(selectedwp, before, cb) async {
  List<WPPostModel> postList = [];

  final LocalStorage wpLocal = new LocalStorage('WP');
  var localPosts = wpLocal.getItem('wpPostList');

  // await wpLocal.clear();
  // wpPostLocal မှ {Updatest_post}ကို {wpId} နဲ့ရှာ updated_time ကိုယူ

  // url , updated_time ရ
  // getPost >updated_time from url နောက်ဆုံးUpdated ရ Good!
  ///wp-json/wp/v2/almanac_entry?per_page=10&filter[orderby]=acf_almanac_date&after=2016-12-23T00:00:00&filter[date_query[column]]=acf_almanac_date
  //

  // var selectedwp = {
  //   before : before;
  //   wpId:1
  // };

  // fetchSetting = {
  //  wpUrl = ""
  // }
  // var before = false;
  var bf = before ? "before" : "after";
  var time = '2023-02-21T17:47:33';
  var WpUrl = selectedwp.url;
  var route = '/?rest_route=/wp/v2/posts';
  var field =
      '&_fields=id,title,date,_links,excerpt,categories,content&_embed=wp:featuredmedia';
  var filter = '&per_page=10&' + bf + '=' + time;
  var Fullurl = WpUrl + route + field + filter;
  myGetApi(Fullurl, (err, apiData) {
    if (!err) {
      // log(apiData);
      var decodedData = jsonDecode(apiData);

      var formatedList = decodedData.map((e) {
        return {
          'id': e['id'],
          'wpid': selectedwp.id,
          'title': e["title"]["rendered"],
          'content': e["content"]["rendered"],
          'excerpt': e['excerpt']['rendered'],
          'date': e['date'],
          'categories': e['categories'],
        };
      }).toList();

      log("loaded from server");
      // local တွင်သိမ်းရန်
      var margeOldNew = List.from(localPosts!)..addAll(formatedList);

      margeOldNew.sort((a, b) => a['date'].compareTo(b['date']));
      margeOldNew.forEach((e) {
        postList.add(WPPostModel(
          id: e['id'],
          wpid: e['id'],
          title: e['title'],
          content: e['content'],
          excerpt: e['excerpt'],
          date: e['date'],
          categories: e['categories'],
        ));
      });

      wpLocal.setItem('wpPostList', null);

      cb(false, postList);
    } else {
      cb(err);
    }
  });
}
