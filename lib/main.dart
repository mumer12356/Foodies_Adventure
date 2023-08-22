
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:io';


import 'Favorite_detail/favorite_provider.dart';
import 'Splash_Onboard_Screen/Splash_screen.dart';
import 'components/constrain.dart';



Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        //brightness: Brightness.light,
        primaryColor: DeepPurpleColor,
        //scaffoldBackgroundColor: Colors.white,
      ),
      home: const Splash(),

    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

