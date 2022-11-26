import 'package:flutter/material.dart';
import 'package:jogo_da_velha/resources/socket_method/socket_method.dart';
import 'package:jogo_da_velha/responsive/responsive.dart';
import 'package:jogo_da_velha/widgets/custom_button/custom_button.dart';
import 'package:jogo_da_velha/widgets/custom_text/custom_text.dart';
import 'package:jogo_da_velha/widgets/custom_textfield/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                textController: _nameController,
                hintText: 'Enter your nickname',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () => _socketMethods.createRoom(_nameController.text),
                text: 'Create',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
