import 'package:a/components/linklist.component.dart';
import 'package:a/components/profile_card.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class RestaurentScreen extends StatelessWidget {
  const RestaurentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(64, 255, 255, 255),
              ),
              child: Center(child: Text("A")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Test Restaurent."),
            )
          ]),
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white, // Navigation bar
              statusBarColor: Color.fromARGB(0, 0, 0, 0), // Status bar
              statusBarIconBrightness: Brightness.light),
          actions: const [
            Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.question_mark,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                CreateTab(),
                FirstCard(),
                SecondCard(),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 0))
                  ]),
                  child: TextButton(
                      onPressed: () async {
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Text("press me")),
                  // child: Text(
                  //   "SELF ORDER WITH QR CODE",
                  //   style: TextStyle(fontSize: 18),
                  //   textAlign: TextAlign.center,
                  // ),
                )
              ],
            ),
          ),
        ));
  }
}

Widget SecondCard() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Colors.black12.withOpacity(0.08),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 0))
    ]),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.all(10), child: Text("Google Maps")),
      Padding(padding: EdgeInsets.all(10), child: Text("Facebook")),
      Padding(padding: EdgeInsets.all(10), child: Text("Whatsapp")),
      Padding(padding: EdgeInsets.all(10), child: Text("Instagram"))
    ]),
  );
}

Widget FirstCard() {
  return Container(
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Colors.black12.withOpacity(0.08),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 0))
    ]),
    child: Column(children: [
      Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("url")),
              Text(
                "resturant",
                style: TextStyle(
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              Text(".waiterio.com")
            ],
          )),
      Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("theme"), Text("gray")],
          )),
      Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("cover photo"),
              Image.network(
                  "https://images.everydayhealth.com/images/diet-nutrition/34da4c4e-82c3-47d7-953d-121945eada1e00-giveitup-unhealthyfood.jpg?sfvrsn=a31d8d32_0",
                  height: 35)
            ],
          )),
      Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.green,
        child: InkWell(
          onTap: () async {
            if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
            }
          },
          child: Text(
            "VISIT WEBSITE",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]),
  );
}

Widget CreateTab() {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Colors.black12.withOpacity(0.08),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 0))
    ]),
    child: Row(children: const [
      Padding(
        padding: EdgeInsets.all(12),
        child: Text("ORDERS      |"),
      ),
      Padding(
        padding: EdgeInsets.all(12),
        child: Text("TABLES      |"),
      ),
      Padding(
        padding: EdgeInsets.all(12),
        child: Text("MENU      |"),
      ),
      Padding(
        padding: EdgeInsets.all(12),
        child: Text("STAR"),
      )
    ]),
  );
}
