import 'package:chabakeaw_chan/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            size: 35.0,
            color: Colors.black,
          ),
        ),
        endDrawer: DrawersMobile(),
        body: ListView(
          children: [
            // Intro, First section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('image-circle.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: SansBold(
                          "Hello I'm",
                          15.0,
                        ),
                      ),
                      SansBold(
                        "chabakeawChan",
                        40.0,
                      ),
                      SansBold(
                        "The Hobbyist",
                        20.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans("chabakeawChan@outlook.com", 15.0),
                          Sans("025555555", 15.0),
                          Sans("Thailand", 15.0),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            // About me, Second section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About me", 35.0),
                  Sans(
                    "Hello, I'm chabakeawChan, the hobbyist. It's too soon to be called an artist.",
                    15.0,
                  ),
                  Sans(
                    "I'm aim to be better in drawing, to make works that not just make myself happy",
                    15.0,
                  ),
                  Sans(
                    ", the others will be happy from seeing it too!",
                    15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer("Painting"),
                      tealContainer("Sketching"),
                      tealContainer("LineArt"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            // What I do, Third section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold(
                  "What I do",
                  35.0,
                ),
                AnimatedCard(
                    imagePath: "IMG_2023_06_07_publish.jpg",
                    text: "original design"),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                    imagePath: "IMG_2023_11_18.jpg", text: "JK chabakeaw"),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                    imagePath: "IMG_2023_12_31.jpg", text: "Bunny girl"),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
            // Contact, fourth section
            SizedBox(
              height: 20.0,
            ),
            ContactFormMobile(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
