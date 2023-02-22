import 'package:a/myProfile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({super.key});

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  List foodList = [
    {
      "image_url":
          "https://cdn.britannica.com/51/128651-050-60CA6B6A/pizza-margherita.jpg",
      "name": "Pizza",
      "description":
          "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta",
      "favourite": true,
      "cart": true,
      "price": 23
    },
    {
      "image_url":
          "https://thumbs.dreamstime.com/b/bugger-grill-pork-french-fries-32397149.jpg",
      "name": "Bugger",
      "description":
          "Middle English (originally denoting a heretic, specifically an Albigensian): from Middle Dutch, from Old French bougre ‘heretic’, from medieval Latin Bulgarus ‘Bulgarian’, particularly one belonging to the Orthodox Church and therefore regarded as a heretic by the Roman Church. The sense ‘sodomite’ (16th century) arose from an association of heresy with forbidden sexual practices; its use as a general insult dates from the early 18th century.",
      "favourite": true,
      "cart": false,
      "price": 33
    },
    {
      "image_url":
          "https://static.toiimg.com/thumb/83740315.cms?imgsize=361903&width=800&height=800",
      "name": "Sandwich",
      "description":
          "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.",
      "favourite": false,
      "cart": false,
      "price": 34
    },
    {
      "image_url":
          "https://cdn.britannica.com/51/128651-050-60CA6B6A/pizza-margherita.jpg",
      "name": "Pizza",
      "description":
          "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta",
      "favourite": false,
      "cart": false,
      "price": 23
    },
    {
      "image_url":
          "https://thumbs.dreamstime.com/b/bugger-grill-pork-french-fries-32397149.jpg",
      "name": "Bugger",
      "description":
          "Middle English (originally denoting a heretic, specifically an Albigensian): from Middle Dutch, from Old French bougre ‘heretic’, from medieval Latin Bulgarus ‘Bulgarian’, particularly one belonging to the Orthodox Church and therefore regarded as a heretic by the Roman Church. The sense ‘sodomite’ (16th century) arose from an association of heresy with forbidden sexual practices; its use as a general insult dates from the early 18th century.",
      "favourite": true,
      "cart": false,
      "price": 33
    },
    {
      "image_url":
          "https://static.toiimg.com/thumb/83740315.cms?imgsize=361903&width=800&height=800",
      "name": "Sandwich",
      "description":
          "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.",
      "favourite": false,
      "cart": false,
      "price": 34
    }
  ];
  void _showToast(content) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Color.fromARGB(131, 39, 39, 39),
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: const Text("Foods"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white, // Navigation bar
              statusBarColor: Color.fromARGB(0, 0, 0, 0), // Status bar
              statusBarIconBrightness: Brightness.light),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     // Navigator.of(context).push(
            //     //     MaterialPageRoute(builder: (builder) => const MyProfile()));
            //   },
            //   icon: const Icon(Icons.person),
            // ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (builder) => const MyProfile()));
                  Navigator.of(context).pushNamed("/myProfile");
                },
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.jKHBRVWDytTl9XLqRRQ7kAHaJ4?pid=ImgDet&rs=1"),
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.orange[50],
          child: ListView.separated(
              itemBuilder: (context, i) {
                return Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          foodList[i]['image_url'],
                          // "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/processed-food700-350-e6d0f0f.jpg",
                          // image: AssetImage("assets/images/image.webp"),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(foodList[i]['name'],
                                  style: Theme.of(context).textTheme.headline6),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                strutStyle: const StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    text: foodList[i]['description']),
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child:
                                          Text("\$ ${foodList[i]['price']}")),
                                  IconButton(
                                      onPressed: () => {
                                            setState(() {
                                              foodList[i]['cart'] =
                                                  !foodList[i]['cart'];
                                            }),
                                            Fluttertoast.cancel(),
                                            _showToast(
                                                foodList[i]['cart'] == true
                                                    ? "add to cart"
                                                    : "remove from cart")
                                          },
                                      icon: foodList[i]['cart'] == true
                                          ? const Icon(
                                              Icons.shopping_cart,
                                              color: Colors.blue,
                                            )
                                          : const Icon(
                                              Icons.add_shopping_cart_sharp)),
                                  IconButton(
                                    hoverColor: Colors.pink,
                                    onPressed: () => {
                                      setState(() {
                                        foodList[i]['favourite'] =
                                            !foodList[i]['favourite'];
                                      }),
                                      Fluttertoast.cancel(),
                                      _showToast(
                                          foodList[i]['favourite'] == true
                                              ? "add to favourite"
                                              : "remove from favourite")
                                    },
                                    icon: foodList[i]['favourite'] == true
                                        ? const Icon(Icons.favorite,
                                            color: Colors.pink)
                                        : const Icon(Icons.favorite_outline),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return const SizedBox(
                  height: 10,
                );
              },
              padding: const EdgeInsets.all(10),
              itemCount: foodList.length),
        ));
    return scaffold;
  }
}
