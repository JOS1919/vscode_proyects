import 'package:firebase_database/screens/add_user.dart';
import 'package:firebase_database/screens/editer_user.dart';
import 'package:firebase_database/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: MyHomePage(),
    // home: const Home(),
    initialRoute: "/",

    routes: {
        "/":(context) => const Home(),
        "/add":(context) => const AddUser(),
        "/edit":(context) => const EditerUser(),
    },
    );
  }
}



