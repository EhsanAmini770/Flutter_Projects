import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_starting_project/components/rounded_button.dart';
import 'package:flash_chat_starting_project/screens/chat_screen.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  bool errorOccurred = false, showSpinner = false;

  @override
  Widget build(BuildContext context) {
    void handleAuthException(FirebaseAuthException e) {
      setState(() {
        errorOccurred = true;
        showSpinner = false;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else {
          errorMessage = e.message ?? 'An error occurred';
        }
      });
    }

    void handleGenericException(dynamic e) {
      setState(() {
        errorOccurred = true;
        errorMessage = e.toString();
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 250.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email', labelText: 'Email'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        return email != null && EmailValidator.validate(email)
                            ? null
                            : 'Please enter a valid Email.';
                      },
                      // getting the value from the email controller
                      // use _emailController.text to get the value
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password', labelText: 'Password'),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) {
                        return password != null && password.length > 5
                            ? null
                            : 'the password should be at least 6 character.';
                      },
                      // getting the value from the password controller
                      // use _passwordController.text to get the value
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Visibility(
                      visible: errorOccurred,
                      child: Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    RoundedButton(
                      title: 'Register',
                      color: kRegisterButtonColor,
                      callback: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            errorOccurred = false;
                            showSpinner = true;
                          });
                          try {
                            final userCredential =
                                await AuthService().createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            setState(() {
                              showSpinner = false;
                            });
                            if (userCredential.user != null) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, ChatScreen.id);
                            }
                          } on FirebaseAuthException catch (e) {
                            handleAuthException(e);
                          } catch (e) {
                            handleGenericException(e);
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
