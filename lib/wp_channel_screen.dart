import 'dart:developer';

import 'package:a/components/catsBar.dart';
import 'package:a/models/archive_get_model.dart';
import 'package:a/models/categories_get_model.dart';
import 'package:a/models/wp_get_model.dart';
import 'package:a/wp_channel_archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skeletons/skeletons.dart';

class Channel extends StatefulWidget {
  // var channelinfo;
  Channel({super.key, required this.channelInfo});
  final WPModel channelInfo;
  // Object? args = ModalRoute.of(context!)?.settings.arguments;
  // log(channelInfo)
  // static BuildContext? get context => null;
  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  List<WPCatModel>? cats = [];
  WPCatModel allCats = WPCatModel(id: 0, name: "All", slug: "all");
  bool isCatLoading = false;
  bool isCatError = false;
  @override
  void initState() {
    super.initState();
    cats!.isEmpty ? loadCat() : '';
  }

  loadCat() async {
    setState(() {
      isCatLoading = true;
      cats!.add(WPCatModel(id: 0, name: "loading", slug: "slug"));
    });
    theWPCats('local', widget.channelInfo, (err, data) async {
      cats = [];
      if (!err) {
        cats!.add(allCats);
        cats = List.from(cats!)..addAll(data);
        // cats = data;
      } else {
        log("err");
        setState(() {
          isCatError = true;
          log("cat load fail");
        });
      }
      setState(() {
        isCatLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: cats!.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.channelInfo.name.toString()),
          centerTitle: true,
          backgroundColor: HSLColor.fromAHSL(
                  1,
                  double.parse(widget.channelInfo.color_hue.toString()),
                  0.5,
                  0.4)
              .toColor(),
          foregroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final tab in cats!) Tab(text: tab.name),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in cats!)
              ChannelArchive(
                  channelInfo: widget.channelInfo, archiveSetting: tab),
            // for (final tab in cats!) Tab(text: tab.name),
          ],
        ),
      ),
    );
  }
}
