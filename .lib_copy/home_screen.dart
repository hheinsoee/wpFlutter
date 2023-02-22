import 'package:a/components/linklist.component.dart';
import 'package:a/components/profile_card.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List linkList = [
    {"label": "Home", "path": "/home", "icon": Icons.home},
    {
      "label": "Food List",
      "path": "/foodList",
      "icon": Icons.lunch_dining_sharp
    },
    {"label": "My Profile", "path": "/myProfile", "icon": Icons.person},
    {"label": "My Exercise", "path": "/exercise", "icon": Icons.class_},
    {
      "label": "Tast Restaurent",
      "path": "/restaurent",
      "icon": Icons.fastfood_rounded
    },
    {"label": "Calculator", "path": "/calculator", "icon": Icons.calculate},
    {"label": "Carosel Slider", "path": "/slider", "icon": Icons.image},
    {"label": "Wordpress List", "path": "/wordpress", "icon": Icons.wordpress}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 30),
              color: Colors.orange[50],
              height: 200,
              width: double.infinity,
              child: profileCardComponent()),
          Expanded(child: drawerServiceComponent(linkList))
        ],
      )),
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white, // Navigation bar
            statusBarColor: Color.fromARGB(0, 0, 0, 0), // Status bar
            statusBarIconBrightness: Brightness.light),
      ),
      body: Center(
          child: Text(
        'Welcome from Home'.toUpperCase(),
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      )),
    );
  }
}
