import 'package:flutter/material.dart';
import 'package:jogo_da_velha/screens/create_room/create_room_screen.dart';
import 'package:jogo_da_velha/screens/join_room/join_room_screen.dart';
import 'package:jogo_da_velha/screens/main_menu/main_menu_screen.dart';
import 'package:jogo_da_velha/utils/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Velha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
