import 'dart:developer';

import 'package:a/apis/wp_get_api.dart';
import 'package:a/models/wp_get_model.dart';
import 'package:flutter/material.dart';

class Wordpress extends StatefulWidget {
  const Wordpress({Key? key}) : super(key: key);

  @override
  State<Wordpress> createState() => _WordpressState();
}

class _WordpressState extends State<Wordpress> {
  List<WpGetModel>? data;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    postGet();
  }

  postGet() async {
    setState(() {
      isLoading = true;
    });
    data = await postGetApi();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wp list'),
        ),
        body: isLoading
            ? Text("loading")
            : ListView.separated(
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  strutStyle: const StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      text: data![i].description),
                                ),
                              ],
                            ),
                          )
                        ]),
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                padding: const EdgeInsets.all(10),
                itemCount: data!.length));
  }
}
