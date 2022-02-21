import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery_app_design/Screens/item_detail_screen.dart';

import 'first_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> days = ["Sunday", "Monday", "Tuesday", "Wednesday"];

  List<int> daysNum = [21, 22, 23, 24];

  bool isSelected = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(46, 51, 71, 1.0),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 670,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBarIcon(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Lets Try",
                        fontSize: 35,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: "some tasty food !",
                        fontSize: 35,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                      const RowTextField(),
                      Container(
                          constraints: const BoxConstraints(
                            maxHeight: 120,
                            minHeight: 100,
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: daysNum.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                      isSelected = true;
                                    });
                                    isSelected = false;
                                  },
                                  child: Weeks(
                                      listIndex: index,
                                      currentIndex: currentIndex,
                                      isSelected: isSelected,
                                      days: days,
                                      daysNum: daysNum),
                                );
                              })),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomCard(
                          text: 'Omlet Borocowli',
                          assetName: "asset/omlet_2.png",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomCard(
                          text: "Green Vegitable",
                          assetName: 'asset/greensalad.png',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.text,
    required this.assetName,
  }) : super(key: key);
  final String text;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ItemDetailPage()));
      },
      child: Container(
        width: 350,
        height: 125,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 2.0),
              ),
            ]),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: text,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  textAlign: TextAlign.start),
              CustomText(
                  text: "Lorem ipsum is a placeholder text commonly used to ",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomText(
                    text: "\$18.00",
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start),
              ),
            ],
          ),
          leading: CircleAvatar(
            maxRadius: 35,
            backgroundImage: AssetImage(assetName),
          ),
        ),
      ),
    );
  }
}

class Weeks extends StatelessWidget {
  const Weeks({
    Key? key,
    required this.listIndex,
    required this.currentIndex,
    required this.isSelected,
    required this.days,
    required this.daysNum,
  }) : super(key: key);

  final int currentIndex;
  final bool isSelected;
  final List<String> days;
  final List<int> daysNum;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: 70,
        constraints: BoxConstraints(
            minHeight: (currentIndex == listIndex) && (isSelected) ? 150 : 100),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
            gradient: currentIndex == listIndex
                ? const LinearGradient(colors: [
                    Color.fromRGBO(237, 108, 73, 1),
                    Color.fromRGBO(241, 166, 86, 1),
                  ])
                : const LinearGradient(colors: [
                    Colors.white,
                    Colors.white,
                  ]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            CustomText(
              text: days[listIndex],
              fontSize: 11,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
                text: daysNum[listIndex].toString(),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 5,
            ),
            currentIndex == listIndex
                ? const Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 28,
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}

class RowTextField extends StatelessWidget {
  const RowTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Card(
          elevation: 5.0,
          child: TextField(
            decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: 280, maxHeight: 50),
                prefixIcon: Icon(
                  Icons.search,
                  size: 29,
                  color: Color.fromRGBO(124, 124, 124, 1),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        Icon(
          Icons.menu,
          size: 31,
          color: Colors.black87,
        )
      ],
    );
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.margin,
          size: 29,
        ),
        Icon(
          Icons.notifications_active,
          size: 29,
        )
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      showElevation: false,
      iconSize: 22,
      backgroundColor: const Color.fromRGBO(46, 51, 71, 1.0),
      items: [
        BottomNavyBarItem(
            title: const Text("Home"),
            icon: const Icon(Icons.home),
            activeColor: Colors.white),
        BottomNavyBarItem(
            title: const Text("Location"),
            activeColor: Colors.white,
            icon: const Icon(Icons.location_on)),
        BottomNavyBarItem(
            title: const Text("Shop"),
            activeColor: Colors.white,
            icon: const Icon(Icons.shopping_cart)),
        BottomNavyBarItem(
            title: const Text("person"),
            activeColor: Colors.white,
            icon: const Icon(Icons.person)),
      ],
      onItemSelected: (int value) {},
    );
  }
}

class Model {
  int? index;
  String? daysName;
  int? daysNum;
  bool? isSelected = false;
  Model({this.isSelected, this.daysNum, this.daysName, this.index});

  List<Model> model = [
    Model(daysName: "Sunday", daysNum: 21),
    Model(
      daysName: "Monday",
      daysNum: 22,
    ),
    Model(daysName: "Tuesday", daysNum: 23),
    Model(daysName: "Wednesday", daysNum: 24),
  ];
}
