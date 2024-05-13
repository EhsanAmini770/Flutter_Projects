import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_starting_project/screens/chat_screen.dart';
import 'package:flash_chat_starting_project/screens/login_screen.dart';
import 'package:flash_chat_starting_project/screens/registration_screen.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackgroundColor,
          ),
          routes: {
            WelcomeScreen.id: (context) => WelcomeScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            RegistrationScreen.id: (context) => const RegistrationScreen(),
            ChatScreen.id: (context) => const ChatScreen(),
          },
          home: AuthService().currentUser == null
              ? WelcomeScreen()
              : const ChatScreen(),
        );
      },
    );
  }
}
