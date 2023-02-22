import 'dart:developer';
import 'dart:ffi';

import 'package:a/models/wp_get_model.dart';
import 'package:a/wp_channel_screen.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Wordpress extends StatefulWidget {
  const Wordpress({Key? key}) : super(key: key);

  @override
  State<Wordpress> createState() => _WordpressState();
}

class _WordpressState extends State<Wordpress> {
  List<WPModel>? data = [];
  bool isLoading = false;
  bool isError = false;
  @override
  void initState() {
    super.initState();
    data!.isEmpty ? postGet() : '';
  }

  postGet() async {
    setState(() {
      isLoading = true;
    });
    wpList('local', (err, wplist) {
      if (!err) {
        setState(() {
          isLoading = false;
          data = wplist;
        });
      } else {
        setState(() {
          isLoading = false;
          isError = true;
        });
      }
    });
  }

  Future refreshWPList() async {
    data = [];
    setState(() {
      isLoading = true;
    });
    wpList('online', (err, wplist) {
      if (!err) {
        setState(() {
          isLoading = false;
          data = wplist;
        });
      } else {
        setState(() {
          isLoading = false;
          isError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Skeleton(
            isLoading: isLoading,
            skeleton: WpListSkeleton(),
            child: RefreshIndicator(
              onRefresh: refreshWPList,
              child: ListView.builder(
                  key: new PageStorageKey('wpList'),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          // "/channel",
                          MaterialPageRoute(
                            builder: (context) =>
                                Channel(channelInfo: data![i]),
                          ),
                          // arguments: <String, WPModel>{'channelInfo': data![i]},
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  data![i].site_icon_url.toString() == 'null'
                                      ? "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"
                                      : data![i].site_icon_url.toString(),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(data![i].name.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      strutStyle:
                                          const StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                          style: const TextStyle(
                                              color: Colors.black),
                                          text: data![i].description),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(10),
                  itemCount: data!.length),
            )));
  }
}

Widget WpListSkeleton() {
  return ListView.separated(
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SkeletonItem(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.rectangle, width: 100, height: 100),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 6,
                      lineStyle: SkeletonLineStyle(
                        randomLength: true,
                        height: 15,
                        borderRadius: BorderRadius.circular(8),
                        minLength: MediaQuery.of(context).size.width / 6,
                        maxLength: MediaQuery.of(context).size.width / 1,
                      )),
                ),
              )
            ],
          )),
        );
      },
      separatorBuilder: (context, i) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 4);
}
