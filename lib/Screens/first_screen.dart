import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery_app_design/Screens/home_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepOrangeAccent,
                Color.fromRGBO(255, 155, 0, 0.9),
              ])),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "asset/pngegg .png",
                  width: 84,
                  height: 50,
                ),
              ),
              const FoodPlateImage(),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "asset/chilly.png.png",
                  width: 84,
                  height: 80,
                ),
              ),
              const HeadingText(),
              const DescriptionText(),
              // const Divider(
              //   indent: 143,
              //   endIndent: 166,
              //   height: 6.1,
              //   thickness: 5.0,
              //   color: Colors.white,
              // ),
              const SizedBox(
                height: 10,
              ),
              const MoveToScreenButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class MoveToScreenButton extends StatelessWidget {
  const MoveToScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(
          186,
          96,
          45,
          1,
        ),
      ),
      child: IconButton(
        onPressed: () {
          print("Clicked");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: const Icon(
          Icons.arrow_forward,
          size: 31,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        width: 297,
        height: 87,
        color: Colors.transparent,
        child: CustomText(
          color: Colors.white,
          textAlign: TextAlign.center,
          fontSize: 16,
          text:
              "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        width: 333,
        height: 87,
        color: Colors.transparent,
        child: Column(
          children: [
            CustomText(
              text: "Life is so",
              fontSize: 30,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
            CustomText(
              text: "endlessly delicious",
              fontSize: 30,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.textAlign,
      this.color,
      this.fontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1,
      textAlign: textAlign,
      style:
          TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}

class FoodPlateImage extends StatelessWidget {
  const FoodPlateImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "asset/plate_food_3.png",
      width: 250,
      height: 250,
      alignment: Alignment.center,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      colorBlendMode: BlendMode.lighten,
    );
  }
}

class BackGroundScreen extends StatelessWidget {
  const BackGroundScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepOrangeAccent,
            Color.fromRGBO(255, 155, 0, 0.9)
          ])),
    );
  }
}
