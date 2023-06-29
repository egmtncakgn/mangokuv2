// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangokuv2/helpers/firebase_options.dart';
import 'package:mangokuv2/helpers/google_sign_in.dart';
import 'package:mangokuv2/screens/homepage.dart';
import 'package:mangokuv2/screens/loginpage.dart';
import 'package:provider/provider.dart';

// Saçma sapan bi hata var ekran değişmek üzreyken oluyor

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    sUIOverlayStyle();

    return ChangeNotifierProvider(
      create: (context) => GSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.black,
            textTheme: GoogleFonts.sourceSansProTextTheme()),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          HomePage.id: (context) => HomePage()
        },
      ),
    );
  }
}

void sUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}
