import 'package:chabakeaw_chan/component.dart';
import 'package:flutter/material.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 600.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "IMG_2023_06_07_publish.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: TabsWebList(),
            )
          ];
        },
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 70.0,
          ),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SansBold(
                  "Works",
                  40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "IMG_2023_06_07_publish.jpg",
                      height: 600.0,
                      width: 400.0,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SansBold(
                            "Chabakeaw 4th design",
                            30.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Sans(
                            "The design that I mostly proud of, she is truly eligant, beautiful, yet has cuties looks as little girl. This design is likely most definitive of most balance between adults charms and cuties as little girl.",
                            15.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
