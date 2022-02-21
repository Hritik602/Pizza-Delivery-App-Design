import 'package:flutter/material.dart';
import 'package:pizza_delivery_app_design/Screens/first_screen.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(46, 51, 71, 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 635,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Image.asset(
                      "asset/item_detail.png",
                      width: 250,
                      height: 250,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "asset/lemon.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const ItemName(),
                    CustomText(
                        text:
                            "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                        fontSize: 19,
                        textAlign: TextAlign.start),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                ),
                              ),
                              Text("Person"),
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              const BottomPriceDetail(),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemName extends StatelessWidget {
  const ItemName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Omelet ,Broccoli",
          fontWeight: FontWeight.w600,
          fontSize: 27,
          textAlign: TextAlign.center,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.remove_circle,
              size: 22,
            ),
            const SizedBox(
              width: 5.0,
            ),
            CustomText(text: "1", fontSize: 19, textAlign: TextAlign.start),
            const SizedBox(
              width: 5.0,
            ),
            const Icon(
              Icons.add_circle,
              size: 22,
            )
          ],
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.arrow_back,
          size: 29,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.favorite_outline_sharp,
            size: 29,
          ),
        ),
      ],
    );
  }
}

class BottomPriceDetail extends StatelessWidget {
  const BottomPriceDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Total Payable",
            fontSize: 14,
            color: Colors.white,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: "\$18.00",
            fontSize: 20,
            color: Colors.white,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
