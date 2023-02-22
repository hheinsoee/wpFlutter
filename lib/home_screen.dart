import 'package:a/myProfile_screen.dart';
import 'package:a/wp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xffff0000));
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Browse',
      style: optionStyle,
    ),
    Wordpress(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    MyProfile(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          // systemNavigationBarColor:Color.fromARGB(255, 255, 0, 0), // Navigation bar
          systemNavigationBarIconBrightness: Brightness.light,
          // systemNavigationBarContrastEnforced: true,
          // systemStatusBarContrastEnforced: true,
          // statusBarColor: Color.fromARGB(0, 0, 0, 0), // Status bar
          // statusBarIconBrightness: Brightness.dark
        ),
        child: Center(
          child: HomeScreen._widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
