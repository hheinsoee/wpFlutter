import 'package:flutter/src/widgets/basic.dart';

class WpGetModel {
  int? id;
  String? name;
  String? description;
  String? site_icon_url;

  WpGetModel(
      {required this.id,
      required this.name,
      required this.description,
      // ignore: non_constant_identifier_names
      required this.site_icon_url});
}

class WpListModel {
  List<WpGetModel>? wpList;
  WpListModel({required this.wpList});

  get length => null;

  void map(Padding Function(dynamic d) param) {}
}
