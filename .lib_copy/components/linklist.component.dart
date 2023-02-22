import 'package:flutter/material.dart';

Widget drawerServiceComponent(List links) {
  return ListView.separated(
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(links[i]["path"]);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
                children: [Icon(links[i]["icon"]), Text(links[i]["label"])]),
          ),
        );
      },
      separatorBuilder: (context, i) {
        return const SizedBox(
          height: 3,
        );
      },
      itemCount: links.length);
}
