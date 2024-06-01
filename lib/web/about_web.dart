import 'package:chabakeaw_chan/component.dart';
import 'package:flutter/material.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
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
          // about me, first section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(
                      "About me",
                      40.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
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
                    Row(
                      children: [
                        tealContainer("Sketching"),
                        SizedBox(
                          width: 7.0,
                        ),
                        tealContainer("Painting"),
                        SizedBox(
                          width: 7.0,
                        ),
                        tealContainer("LineArt"),
                      ],
                    )
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
                      child: Image.asset(
                        "image-circle.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "IMG_2023_06_07_publish.jpg",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(
                      "Original design",
                      30.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans(
                      "Chabakeaw 4th official design",
                      15.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          // third section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(
                      "JK Chabakeaw",
                      30.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans(
                      "Chabakeaw finally be Senior High School girl",
                      15.0,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: "IMG_2023_11_18.jpg",
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          // fourth section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "IMG_2023_12_31.jpg",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(
                      "Bunny Chabakeaw",
                      30.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Sans(
                      "Would you like to adopt bunny Chabakeaw?",
                      15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
