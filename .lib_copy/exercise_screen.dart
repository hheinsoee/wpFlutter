import 'package:a/components/linklist.component.dart';
import 'package:a/components/profile_card.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Project",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black, // Navigation bar
            statusBarColor: Color.fromARGB(0, 0, 0, 0), // Status bar
            statusBarIconBrightness: Brightness.dark),
        actions: const [
          Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [FirstCard(), ActivityTask()],
        ),
      ),
    );
  }
}

Widget ActivityTask() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Activity Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Icon(
              Icons.more_horiz,
              color: Colors.black54,
            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.08),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 0))
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Satistics",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    Text(
                      "Weekly",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black54)
                  ])
                ],
              ),
            ),
            Image.network(
                "https://www.mongodb.com/docs/charts/images/charts/discrete-area-small.png")
          ],
        ),
      )
    ],
  );
}

Widget FirstCard() {
  return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.08),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://www.pinnacle.com/Cms_Data/Contents/Guest/Media/Sport/article-preview-epl-hero.jpg",
                    fit: BoxFit.cover,
                    height: 66,
                    width: 66,
                  ),
                ),
                const Flexible(
                    child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("page for PREMIER LEAGUE project",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: Stack(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th/id/OIP.jKHBRVWDytTl9XLqRRQ7kAHaJ4?pid=ImgDet&rs=1"),
                        radius: 18,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://imageio.forbes.com/specials-images/imageserve//62aa51710c3e65f16ed3b373/0x0.jpg?format=jpg&crop=1928,1314,x217,y0,safe&width=1200"),
                          radius: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://resources.premierleague.com/photos/2022/11/05/99e39250-92b6-447d-8b7e-37efd82dec8c/Erling-Haaland-Man-City.jpg?width=930&height=620"),
                          radius: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: Colors.black54,
                      ),
                      Text(
                        " 09:18 - 12-16 AM",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ))
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Discription",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              strutStyle: const StrutStyle(fontSize: 12.0),
              text: const TextSpan(
                  style: TextStyle(color: Colors.black54),
                  text:
                      "The Premier League is the highest level of the men's English football league system. Contested by 20 clubs, it operates on a system of promotion and relegation with the English Football League. Seasons typically run from August to May with each team playing 38 matches."),
            ),
          )
        ],
      ));
}
