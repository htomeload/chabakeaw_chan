import 'package:chabakeaw_chan/component.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: ListView(
            children: [
              // introduction, first section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "image-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(
                      height: 10.0,
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
                height: 40.0,
              ),
              // second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "IMG_2023_06_07_publish.jpg",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    "Original design",
                    20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Sans(
                    "Chabakeaw 4th official design",
                    15.0,
                  ),
                ],
              ),
              // third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "IMG_2023_11_18.jpg",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    "JK chabakeaw",
                    20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Sans(
                    "Chabakeaw finally be Senior High School girl",
                    15.0,
                  ),
                ],
              ),
              // forth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "IMG_2023_12_31.jpg",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    "Bunny Chabakeaw",
                    20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Sans(
                    "Would you like to adopt bunny Chabakeaw?",
                    15.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
