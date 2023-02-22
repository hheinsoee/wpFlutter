import 'dart:convert';
import 'dart:developer';
import 'package:a/models/archive_get_model.dart';
import 'package:a/models/wp_get_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:skeletons/skeletons.dart';

class ChannelArchive extends StatefulWidget {
  // var channelinfo;
  ChannelArchive(
      {super.key, required this.channelInfo, required this.archiveSetting});
  final WPModel channelInfo;
  final archiveSetting;
  // Object? args = ModalRoute.of(context!)?.settings.arguments;
  // log(channelInfo)
  // static BuildContext? get context => null;
  @override
  State<ChannelArchive> createState() => _ChannelArchiveState();
}

class _ChannelArchiveState extends State<ChannelArchive> {
  List<WPPostModel> postList = [];

  final LocalStorage wpLocal = new LocalStorage('WP');

  bool isPostLoading = false;
  bool isPostError = false;
  @override
  void initState() {
    super.initState();

    if (wpLocal.getItem('wpPostList') != null) {
      List localPost = wpLocal.getItem('wpPostList');
      print(localPost.runtimeType);
      log(localPost.length.toString());

      localPost.forEach((e) {
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
      // print(localPost.runtimeType);

      // log(postList.toString());
      setState(() {
        isPostLoading = false;
      });
    } else {
      loadPosts();
    }
  }

  Future loadUpdate() async {
    loadPosts();
  }

  loadPosts() async {
    setState(() {
      isPostLoading = true;
    });
    wpPostList(widget.channelInfo, true, (err, data) {
      if (!err) {
        postList = data;
      } else {
        log(err);
        if (this.mounted) {
          setState(() {
            isPostError = false;
          });
        }
      }
      if (this.mounted) {
        setState(() {
          isPostLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isLoading: isPostLoading,
      skeleton: Text("loading"),
      child: RefreshIndicator(
        onRefresh: loadUpdate,
        child: ListView.builder(
            key: new PageStorageKey('wpList'),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(postList[i].title.toString(),
                        style: Theme.of(context).textTheme.headline6),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      strutStyle: const StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          text: postList[i].content),
                    ),
                  ],
                ),
              );
            },
            padding: const EdgeInsets.all(10),
            itemCount: postList.length),
      ),
    );
  }
}
