import 'dart:developer';

import 'package:a/models/categories_get_model.dart';
import 'package:flutter/material.dart';

Widget CatsBar(Object channelInfo) {
  List<WPCatModel>? cats = [];
  bool isCatLoading = false;
  // void initState() {
  //   initState();

  theWPCats('loacl', channelInfo, (err, data) async {
    log("message");
    if (!err) {
      cats = data;
      log(data.toString());
    } else {
      log("err");
    }
  });
  // }
  // theWPCats(fetch, wpInfo, cb)
  // @override
  // Widget build(BuildContext context) {
  return Text("hello");
  // }
}
