// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFileTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFileTest> {
  TextEditingController numberOne = TextEditingController();
  TextEditingController numberTwo = TextEditingController();
  double n1 = 0;
  double n2 = 0;
  double result = 0;
  String operator = "+";
  String tempOperator = "+";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Color.fromARGB(255, 108, 119, 175),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 20),
              child: Text(
                "Number1",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: numberOne,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    // suffixIcon: Icon(Icons.format_list_numbered_sharp) to appear icon backwards
                    errorText: "Required Field",
                    // filled: true,fillColor: Colors.blue // to put background color (we will use this with a pairs )
                    focusedBorder: OutlineInputBorder(),
                    focusedErrorBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 20),
              child: Text(
                "Number2",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: numberTwo,
                keyboardType: TextInputType.number,
              ),
            ),
            ListTile(
              title: const Text('+'),
              leading: Radio(
                value: "+",
                groupValue: tempOperator,
                onChanged: (value) {
                  setState(() {});
                  tempOperator = value.toString();
                },
              ),
            ),
            ListTile(
              title: const Text('-'),
              leading: Radio(
                value: "-",
                groupValue: tempOperator,
                onChanged: (value) {
                  setState(() {});
                  tempOperator = value.toString();
                },
              ),
            ),
            ListTile(
              title: const Text('*'),
              leading: Radio(
                value: "*",
                groupValue: tempOperator,
                onChanged: (value) {
                  setState(() {});
                  tempOperator = value.toString();
                },
              ),
            ),
            ListTile(
              title: const Text('/'),
              leading: Radio(
                value: "/",
                groupValue: tempOperator,
                onChanged: (value) {
                  setState(() {});
                  tempOperator = value.toString();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          n1 = double.parse(numberOne.text);
                          n2 = double.parse(numberTwo.text);
                          operator = tempOperator;
                          switch (operator) {
                            case "+":
                              result = n1 + n2;
                              break;

                            case "-":
                              result = n1 - n2;
                              break;

                            case "*":
                              result = n1 * n2;
                              break;

                            case "/":
                              result = n1 / n2;
                              break;
                          }
                        });
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Result",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$n1 $operator $n2 = $result",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
