import 'package:flutter/material.dart';
import 'package:whatsapp_ui/View/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
// Code to change theme mode
bool iconBool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;
 ThemeData lightTheme =
      ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light);
  ThemeData darkTheme =
      ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
       
      home:const SplashScreen(),
    );
  }
}
