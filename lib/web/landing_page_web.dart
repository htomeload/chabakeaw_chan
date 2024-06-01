import 'package:chabakeaw_chan/component.dart';
import 'package:flutter/material.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          // first page
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold(
                        "Hello I'm",
                        15.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SansBold("chabakeawChan", 55.0),
                    Sans("A hobbyist, it's too soon to be called an artist.",
                        30.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("chabakeaw.chan@outlook.com", 15.0),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("www.facebook.com/chabakeawChan", 15.0),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.link),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("lit.link/en/chabakeawChan", 15.0),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("image-circle.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
          // second page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              children: [
                Image.asset(
                  'web.jpg',
                  height: widthDevice / 1.9,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(
                      height: 15,
                    ),
                    Sans(
                        "Hello, I'm chabakeawChan, a hobbyist who like to make artworks.",
                        15.0),
                    Sans(
                        "I'm strive to be better in the drawing and painting, ",
                        15.0),
                    Sans("overall I'm like to get close what good artist been.",
                        15.0),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        tealContainer("Anime girl portrait"),
                        SizedBox(
                          width: 7,
                        ),
                        tealContainer("Sketching"),
                        SizedBox(
                          width: 7,
                        ),
                        tealContainer("Headshot"),
                        SizedBox(
                          width: 7,
                        ),
                        tealContainer("Half-body"),
                        SizedBox(
                          width: 7,
                        ),
                        tealContainer("Cowboy shot"),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          // third section
          Container(
            height: heightDevice / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I done?", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'IMG_2023_06_07_publish.jpg',
                      text: "Chabakeaw original design",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: 'IMG_2023_11_18.jpg',
                      text: "Chabakeaw JK",
                    ),
                    AnimatedCard(
                      imagePath: 'IMG_2023_12_31.jpg',
                      text: "Bunny Chabakeaw",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ],
                )
              ],
            ),
          ),
          // fourth section
          SizedBox(
            height: 20.0,
          ),
          ContactFormWeb(),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
