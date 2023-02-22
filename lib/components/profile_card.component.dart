import 'package:flutter/material.dart';

Widget profileCardComponent() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
            "https://th.bing.com/th/id/OIP.jKHBRVWDytTl9XLqRRQ7kAHaJ4?pid=ImgDet&rs=1"),
      ),
      Text("Messi", style: TextStyle(fontSize: 19))
    ],
  );
}
