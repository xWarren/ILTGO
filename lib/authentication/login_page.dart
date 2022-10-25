import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iltgo/authentication/register_page.dart';
import 'package:iltgo/authentication/splashscreen.dart';

import '../colors/textcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  // login form
  final _keyForm = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase auth
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      style: const TextStyle(color: ColorText.secondary),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Email");
        }
        // register expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[gmail]+[.]+[c-o-m]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(FontAwesomeIcons.solidAddressCard),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: "Email",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: _obscureText,
      style: const TextStyle(color: ColorText.secondary),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid password(Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(FontAwesomeIcons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: "Password",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: ColorText.accent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          minWidth: 200,
          onPressed: () {
            login(emailController.text, passwordController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: ColorText.secondary,
                fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: ColorText.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Form(
              key: _keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 170,
                      child: Image.asset(
                        "assets/iLTGoLogo.png",
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(height: 45),
                  emailField,
                  const SizedBox(height: 20),
                  passwordField,
                  const SizedBox(height: 25),
                  loginButton,
                  const SizedBox(height: 30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: ColorText.secondary),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: const Text(
                            " Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.green),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void login(String email, String password) async {
    if (_keyForm.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MySplash())),
              })
          .catchError((e) {
        Fluttertoast.showToast(
            msg: e!.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: ColorText.secondary,
            fontSize: 16.0);
      });
    }
  }
}
