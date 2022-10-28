import "package:flutter/material.dart";
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passVisible = false;

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String pass = _passController.text;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: authTheme,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "sfpro",
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                    children: [
                      TextSpan(text: "Home > "),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontFamily: "sfpro",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 74, 74, 74),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset("assets/images/login.png"),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "buttershine",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Login and get the best deals now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: authSecondaryColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text("*Email"),
              const SizedBox(height: 5.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: authSecondaryColor))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!emailRegex.hasMatch(value)) {
                    return "Invalid email";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text("*Password"),
              const SizedBox(height: 5.0),
              TextFormField(
                controller: _passController,
                obscureText: !passVisible,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: !passVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passVisible = !passVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: authSecondaryColor))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }

                  if (value.length < 6) {
                    return "Invalid Password";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "sfpro",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "sfpro",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              OutlinedButton(
                onPressed: () => {Navigator.pushNamed(context, "signup")},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  side: const BorderSide(color: authPrimaryColor),
                ),
                child: const Text(
                  "New User? Register here",
                  style: TextStyle(
                    fontFamily: "sfpro",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
