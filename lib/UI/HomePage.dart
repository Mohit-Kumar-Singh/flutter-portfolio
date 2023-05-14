import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/UI/About.dart';

import 'package:potrtfolio/Widget/AppBarTitle.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  //whatsapp fuction
  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
    }

    //   if(platform) {
    //     return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
    //   } else {
    //     return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
    //   }
    // }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 14, 54),
      body:
          // decoration: BoxDecoration(
          //   color: Color.fromARGB(1, 5, 14, 54),
          //   // gradient: LinearGradient(
          //   //   colors: [
          //   //     Color.fromARGB(1, 5, 14, 54),
          //   //     // Color.fromARGB(255, 61, 255, 255)
          //   //   ],
          //   // ),
          // ),
          SingleChildScrollView(
        physics: ScrollPhysics(),
        primary: true,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Navigation Bar
            Container(
              height: size.height * 0.14,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // IconButton(
                    //     icon: Icon(
                    //       Icons.change_history,
                    //       size: 32.0,
                    //       color: Color(0xff64FFDA),
                    //     ),
                    //     onPressed: () {}),
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: .0),
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            onTap: (index) async {
                              _scrollToIndex(index);
                            },
                            tabs: [
                              Tab(
                                child: AppBarTitle(
                                  text: 'About',
                                ),
                              ),
                              // Tab(
                              //   child: AppBarTitle(
                              //     text: 'Education',
                              //   ),
                              // ),
                              // Tab(
                              //   child: AppBarTitle(
                              //     text: 'Certifiction',
                              //   ),
                              // ),
                              // Tab(
                              //   child: AppBarTitle(
                              //     text: 'Resposibility',
                              //   ),
                              // ),
                              Tab(
                                child: AppBarTitle(
                                  text: 'Contact Us',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //RESUME button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Card(
                        elevation: 4.0,
                        color: Color(0xff64FFDA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(0.85),
                          height: size.height * 0.07,
                          width: size.height * 0.20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 14, 54),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: FlatButton(
                            //  hoverColor: Color(0xFF3E0449),
                            onPressed: () {
                              method.launchURL(
                                  "https://drive.google.com/file/d/11-94ahAIiLN65SrqC9U-b0GIiu20jKLi/view?usp=sharing");
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                "Report ",
                                style: TextStyle(
                                  color: Color(0xff64FFDA),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                //Social Icon
                Container(
                  width: size.width * 0.09,
                  height: size.height - 82,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL(
                                "https://github.com/Mohit-Kumar-Singh");
                          }),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.paperclip),
                          color: Color(0xffffA8B2D1),
                          iconSize: 16.0,
                          onPressed: () {
                            method.launchURL(
                                "https://drive.google.com/file/d/1fgS7y7Fx6JRnkindG-55c8CWM8hTgDT_/view?usp=share_link");
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: size.height * 0.20,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height - 82,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomScrollView(
                        controller: _autoScrollController,
                        slivers: <Widget>[
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * .06,
                                ),
                                CustomText(
                                  text: "we Help to Secure ",
                                  textsize: 16.0,
                                  color: Color(0xff41FBDA),
                                  letterSpacing: 3.0,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                AnimatedTextKit(
                                  totalRepeatCount: 10,
                                  pause: Duration(milliseconds: 4000),
                                  animatedTexts: [
                                    TyperAnimatedText('"Data & Information"',
                                        speed: Duration(milliseconds: 200),
                                        textStyle: const TextStyle(
                                          color: Color(0xffCCD6F6),
                                          fontSize: 68,
                                        )),
                                  ],
                                ),
                                // CustomText(
                                //   text: "Data & Information",
                                //   textsize: 68.0,
                                //   color: Color(0xffCCD6F6),
                                //   fontWeight: FontWeight.w900,
                                // ),

                                SizedBox(
                                  height: 4.0,
                                ),
                                CustomText(
                                  text: "From Misuse",
                                  textsize: 50.0,
                                  color: Color(0xffCCD6F6).withOpacity(0.6),
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: size.height * .04,
                                ),

                                Wrap(
                                  children: [
                                    Text(
                                      "Malicious URL detection is basically a URL classifier that classifies the user-inputted URL into Safe or Malicious so that users can check if the URL is legit or malicious before visiting the URL & can avoid exposure to malicious software trying to steal their data.",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        letterSpacing: 2.75,
                                        wordSpacing: 0.75,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .12,
                                ),
                                // RESUME button
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Card(
                                    elevation: 4.0,
                                    color: Color(0xff64FFDA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(0.85),
                                      height: size.height * 0.07,
                                      width: size.height * 0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 5, 14, 54),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter a URL to Check',
                                            hintStyle: TextStyle(
                                              color: Color(0xffCCD6F6),
                                            )),
                                      ),
                                      // child:
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  // hoverColor: Color(0xFF3E0449),
                                  onPressed: () {
                                    method.launchURL(
                                        "https://www.instagram.com/mohit_kumar_singh/");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      "Check",
                                      style: TextStyle(
                                        color: Color(0xff64FFDA),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: size.height * 0.20,
                                ),
                              ],
                            ),

                            //About
                            _wrapScrollTag(
                              index: 0,
                              child: About(),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),

                            SizedBox(
                              height: 6.0,
                            ),

                            //Get In Touch
                            _wrapScrollTag(
                              index: 1,
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * 0.68,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    // color: Colors.orange,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "What's Next?",
                                          textsize: 16.0,
                                          color: Color(0xff41FBDA),
                                          letterSpacing: 3.0,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        CustomText(
                                          text: "Get In Touch",
                                          textsize: 42.0,
                                          color: Colors.white,
                                          letterSpacing: 3.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        Wrap(
                                          children: [
                                            Text(
                                              "Although this is our Final Year Project , but feel free to contact. Whether you have a question or just want to say hi,\nwe'll try our best to get back to you!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                letterSpacing: 0.75,
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32.0,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            method.launchEmail();
                                          },
                                          child: Card(
                                            elevation: 4.0,
                                            color: Color(0xff64FFDA),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(0.85),
                                              height: size.height * 0.09,
                                              width: size.width * 0.10,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 5, 14, 54),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                ),
                                                child: Text(
                                                  "Say Hello",
                                                  style: TextStyle(
                                                    color: Color(0xff64FFDA),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Footer
                                  Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    //color: Colors.white,
                                    child: Text(
                                      "Designed & Built by Tarushi , Saatwik, Surbhi & Mohit With 💙 ML & Flutter",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        letterSpacing: 1.75,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.height - 82,
                  //color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 45,
                        child: InkWell(
                          onTap: () {
                            method.launchURL("https://www.akgec.ac.in/");
                          },
                          child: Text(
                            "https://www.akgec.ac.in/",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        //   child: Text(
                        //     "mohit1911048@akgec.ac.in",
                        //     style: TextStyle(
                        //       color: Colors.grey.withOpacity(0.6),
                        //       letterSpacing: 3.0,
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //   ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 100,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
