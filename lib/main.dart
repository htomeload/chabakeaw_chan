import 'package:chabakeaw_chan/firebase_options.dart';
import 'package:chabakeaw_chan/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBPB-WPKNQM3mtA_LfrpQm2vrbzx3mG74c",
        authDomain: "flutter-portfolio-dfe3e.firebaseapp.com",
        projectId: "flutter-portfolio-dfe3e",
        storageBucket: "flutter-portfolio-dfe3e.appspot.com",
        messagingSenderId: "616728188000",
        appId: "1:616728188000:web:0cdb65bc3c149a1005df05",
        measurementId: "G-4ZDTQD328E",
      ),
    );
  } else {
    GoogleFonts.config.allowRuntimeFetching = false;
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
