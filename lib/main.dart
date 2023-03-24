import 'package:flutter/material.dart';
import 'package:omega_app/Providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/config_screen.dart';
import 'Screens/form_screen.dart';
import 'Screens/home_page.dart';

void main() {

  // UserService userService = UserService();
  // userService.post(User(userName: 'vinicius', userHistory: 'hoje', userPhoto: 'foto do viniicus'));
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omega',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomePage(),
        'form':(context) =>  const FormScreen(),
        'config':(context) => const ConfigScreen()
      },
    );
  }
}

