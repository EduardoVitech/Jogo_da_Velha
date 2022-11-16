import 'package:flutter/material.dart';
import 'package:jogo_da_velha/responsive/responsive.dart';
import 'package:jogo_da_velha/widgets/custom_button/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {},
              text: 'Create Room',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {},
              text: 'Join Room',
            ),
          ],
        ),
      ),
    );
  }
}
