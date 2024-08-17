import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo2/firebase_options.dart';
import 'package:todo2/home_screen.dart';
import 'package:todo2/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}
