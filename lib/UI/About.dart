import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

class About extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 2.0,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "01.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    AnimatedTextKit(
                      totalRepeatCount: 10,
                      pause: Duration(milliseconds: 180),
                      animatedTexts: [
                        TyperAnimatedText('About Our Project',
                            speed: Duration(milliseconds: 250),
                            textStyle: const TextStyle(
                              color: Color(0xffCCD6F6),
                              fontSize: 26,
                            )),
                      ],
                    ),
                    // CustomText(
                    //   text: "About Our Project",
                    //   textsize: 26.0,
                    //   color: Color(0xffCCD6F6),
                    //   fontWeight: FontWeight.w700,
                    // ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 5,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "Malicious URLs host various unsolicited content and can pose a high threat to potential victims. Therefore, a fast and efficient detection technique is needed. In this project, we focus on the problem of detecting malicious URls based on the information obtained from URLs using machine-learning technologies. We proceeded in two steps. First, we created a tool that extracts Lexical-Features from the URL The use of such static features is safer and faster since it does not involve execution. Second, we trained and evaluated models using MultinomialNB, Logistic-Regression, and Random Forest. Later, we also used fuzzy string-matching approach. The efficiencyand accuracy of these models are measured and compared. The results are   showing the ability and suitability of tested technologies to predict the probability of a URL being malicious.",
                      textsize: 20.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.90,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Image
          Expanded(
            child: Container(
              height: size.height / 2,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Image(image: AssetImage("images/bg-111.png"))),
                  // CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation({Key key}) : super(key: key);

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Color(0xff61F9D5).withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  bool img = false;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Color(0xff61F9D5).withOpacity(0.5);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      bool img = true;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: Colors.black54,
            child: _exitCounter % 2 == 0
                ? Image(
                    fit: BoxFit.cover,
                    image: AssetImage("images/AKG.png"),
                  )
                : Image(
                    fit: BoxFit.cover,
                    image: AssetImage("images/mypic.jpeg"),
                  ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
