import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String itemMessage = "";
  final int _price = 2000;
  int _number = 0;
  int _cost = 0;

  myClick() {
    setState(() {
      itemMessage = "U add this in cart";
      _number++;
      _cost = _number * _price;
    });
    // print("add to cart");
    log("this {item} is added {his} cart");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Messi", style: TextStyle(fontSize: 20)),
                            const Text("ဆိတ်"),
                            Text('$_price' ' ks')
                          ]),
                    )),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: myClick,
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.pink[50],
                            ),
                            icon: const Icon(Icons.add_shopping_cart_sharp,
                                color: Colors.pink),
                            label: Text('$_number' " add"),
                          ),
                          Text(
                            '$_cost' ' ks',
                          )
                        ]))
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("User Info"),
                    Text("User Info"),
                    Text("User Info"),
                    Text("User Info"),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
