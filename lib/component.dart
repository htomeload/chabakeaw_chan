import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher_string.dart';

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({this.title, this.route, super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  textStyle: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -8))
                    ],
                    fontSize: 25.0,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Colors.tealAccent,
                  ),
                )
              : GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({
    super.key,
    required this.text,
    required this.route,
  });

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 40.0,
        minWidth: 200.0,
        color: Colors.black,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class SansBold extends StatelessWidget {
  final String text;
  final double size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: size,
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final String text;
  final double containerWidth;
  final String hintText;
  final int maxLines;
  final controller;
  final validator;

  const TextForm({
    super.key,
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.maxLines = 1,
    this.controller = null,
    this.validator = null,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard(
      {super.key,
      required this.imagePath,
      this.fit = BoxFit.cover,
      this.reverse = false,
      this.height = 200,
      this.width = 200,
      this.text = ""});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late Animation<Offset> _animation = Tween(
    begin: widget.reverse ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        surfaceTintColor: Color.fromARGB(238, 238, 239, 255),
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height,
                width: widget.width,
                fit: widget.fit,
              ),
              SizedBox(
                height: 10.0,
              ),
              widget.text == ""
                  ? SansBold(widget.text, 15.0)
                  : SizedBox(
                      height: 0.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom({
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        textStyle: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class AddDataFirestore {
  var logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  Future addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response
        .add({
          'first name': firstName,
          'last name': lastName,
          'email': email,
          'phone number': phoneNumber,
          'message': message
        })
        .then((value) => true)
        .catchError((error) {
          logger.d(error);
          return false;
        });
  }
}

Future DialogError(BuildContext context, String title) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: SansBold(title, 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: "Home",
          route: "/",
        ),
        Spacer(),
        TabsWeb(
          title: "Works",
          route: "/works",
        ),
        Spacer(),
        TabsWeb(
          title: "Lit.link",
          route: "/lit_link",
        ),
        Spacer(),
        TabsWeb(
          title: "About",
          route: "/about",
        ),
        Spacer(),
        TabsWeb(
          title: "Contact",
          route: "/contact",
        ),
        Spacer(),
      ],
    );
  }
}

class DrawersWeb extends StatefulWidget {
  const DrawersWeb({super.key});

  @override
  State<DrawersWeb> createState() => _DrawersWebState();
}

urlLauncher(String svgPath, String url) {
  return IconButton(
    onPressed: () async {
      await launchUrlString(url);
    },
    icon: SvgPicture.asset(
      svgPath,
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      width: 45.0,
    ),
  );
}

class _DrawersWebState extends State<DrawersWeb> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("image.png"),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SansBold("chabakeawChan", 30.0),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                  "instagram.svg", "https://www.instagram.com/chabakeawchan"),
              urlLauncher("twitter.svg", "https://twitter.com/chabakeawChan"),
              urlLauncher(
                  "facebook.svg", "https://www.facebook.com/chabakeawChan"),
            ],
          )
        ],
      ),
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
              ),
              child: Image.asset('image-circle.png'),
            ),
          ),
          TabsMobile(text: "Home", route: '/'),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(text: "Works", route: '/works'),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(text: "Lit.link", route: '/lit_link'),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(text: "About", route: '/about'),
          SizedBox(
            height: 20.0,
          ),
          TabsMobile(text: "Contact", route: '/contact'),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                  "instagram.svg", "https://www.instagram.com/chabakeawchan"),
              urlLauncher("twitter.svg", "https://twitter.com/chabakeawChan"),
              urlLauncher(
                  "facebook.svg", "https://www.facebook.com/chabakeawChan"),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.0,
            ),
            SansBold("Contact me", 40.0),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextForm(
                      text: "First Name",
                      containerWidth: 350.0,
                      hintText: "Please type first name",
                      controller: _firstNameController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "Firstname is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextForm(
                      text: "Email",
                      containerWidth: 350.0,
                      hintText: "Please type email",
                      controller: _emailController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "Email is required";
                        }
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextForm(
                      text: "Last Name",
                      containerWidth: 350.0,
                      hintText: "Please type last name",
                      controller: _lastNameController,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextForm(
                      text: "Phone Number",
                      containerWidth: 350.0,
                      hintText: "Please type phone number",
                      controller: _phoneController,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            TextForm(
              text: "Message",
              containerWidth: widthDevice / 1.73,
              hintText: "Please type your message",
              maxLines: 10,
              controller: _messageController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Message is required";
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () async {
                final addData = new AddDataFirestore();
                if (formKey.currentState!.validate()) {
                  if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text,
                  )) {
                    formKey.currentState!.reset();
                    DialogError(context, "Message sent successfully");
                  } else {
                    DialogError(context, "Message failed to sent");
                  }
                }
              },
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 60.0,
              minWidth: 200.0,
              color: Colors.tealAccent,
              child: SansBold("Submit", 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold(
            "Contact me",
            35.0,
          ),
          TextForm(
            text: "First Name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Firstname is required";
              }
            },
          ),
          TextForm(
            text: "Last Name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
            controller: _phoneController,
          ),
          TextForm(
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type email",
            controller: _emailController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Email is required";
              }
            },
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
          ),
          MaterialButton(
            onPressed: () async {
              final addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: SansBold(
              "Submit",
              20.0,
            ),
          )
        ],
      ),
    );
  }
}

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
