import "package:flutter/material.dart";
import "../theme.dart";

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signup";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleSignUp() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      print(email);
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.menu_rounded,
                          size: 30.0,
                          color: Color.fromARGB(255, 74, 74, 74),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.search,
                              size: 30.0,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_border,
                              size: 30.0,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 30.0,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.account_circle_outlined,
                              size: 30.0,
                              color: authPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 150, 150, 150),
                        ),
                        children: [
                          TextSpan(text: "Home > "),
                          TextSpan(
                            text: "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Image.asset("assets/images/register.png"),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Register",
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
                    "Register and get the best deals now",
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
                    height: 15.0,
                  ),
                  const Text(
                    "A link to set a new password will be sent to your email address.",
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: handleSignUp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text(
                      "Send Mail",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  OutlinedButton(
                    onPressed: () => {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      side: const BorderSide(color: authPrimaryColor),
                    ),
                    child: const Text(
                      "Already a User? Sign In",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12.0,
                          color: authSecondaryColor,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  "Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our "),
                          TextSpan(
                            text: "privacy policy.",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                // decorationColor: Colors.red,
                                decorationThickness: 2),
                          ),
                        ]),
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
