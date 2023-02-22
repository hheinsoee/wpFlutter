import 'package:a/calculator_screen.dart';
import 'package:a/carousel_image_slider_screen.dart';
import 'package:a/exercise_screen.dart';
import 'package:a/home_screen.dart';
import 'package:a/myProfile_screen.dart';
import 'package:a/wp_screen.dart';
import 'package:a/restaurent_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'foodList_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.orange[800],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: HomeScreen(),
      // initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/foodList': (context) => const FoodWidget(),
        '/myProfile': (context) => const MyProfile(),
        '/exercise': (context) => ExerciseScreen(),
        '/restaurent': (context) => RestaurentScreen(),
        '/slider': (context) => CaroselSlider(),
        '/calculator': (context) => TextFileTest(),
        '/wordpress': (context) => Wordpress()
      },
    );
  }
}
