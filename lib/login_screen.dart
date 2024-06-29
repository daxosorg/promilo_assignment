import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promilo_assignment/second_screen.dart';
import 'package:promilo_assignment/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkForm);
    _passwordController.addListener(_checkForm);
  }

  void _checkForm() {
    setState(() {
      _isButtonDisabled = _emailController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      String password = _passwordController.text;

      var bytes = utf8.encode(password);
      var digest = sha256.convert(bytes);

      var formData = "username=$email&password=$digest&grant_type=password";
      const url = 'https://apiv2stg.promilo.com/user/oauth/token';
      final headers = {
        'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: formData,
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid ID Password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'promilo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Hi, Welcome Back!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  AppTextField(
                    emailCtrl: _emailController,
                    label: 'Enter Email or Mob No.',
                    title: 'Please Sign in to continue',
                    alternateButton2Text: 'Sign In With OTP',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  AppTextField(
                    emailCtrl: _passwordController,
                    label: 'Enter Password',
                    title: 'Password',
                    alternateButton2Text: 'Forget Password',
                    alternateWidget1: Flexible(
                      child: Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: const CheckboxThemeData(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            child: Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled ? null : _login,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                          if (states.contains(WidgetState.disabled)) {
                            return Colors.blueGrey.withOpacity(.5);
                          }
                          return Colors.blueGrey.withOpacity(.5);
                        }),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 18)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Colors.black12)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.black12)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/googleicon.png', height: 40),
                      const SizedBox(width: 5),
                      Image.asset('assets/linkedinicon.png', height: 40),
                      const SizedBox(width: 5),
                      Image.asset('assets/facebookicon.png', height: 40),
                      const SizedBox(width: 5),
                      Image.asset('assets/instagramicon.png', height: 40),
                      const SizedBox(width: 5),
                      Image.asset('assets/whatsappicon.png', height: 40),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Business User?',
                        style: TextStyle(fontSize: 19, color: Colors.grey[800]),
                      ),
                      Text(
                        "Don't have an account",
                        style: TextStyle(fontSize: 19, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Login Here',
                        style: TextStyle(fontSize: 19, color: Colors.lightBlue[900]),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 19, color: Colors.lightBlue[900]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'By continuing, you agree to',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey.withOpacity(.8)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Promilo’s',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey.withOpacity(.8)),
                      ),
                      const Text(
                        ' Terms of Use & Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
