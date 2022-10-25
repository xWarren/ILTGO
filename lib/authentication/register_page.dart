import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iltgo/authentication/user_class.dart';
import '../colors/textcolor.dart';
import '../pages/main_pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  //form
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // firebase auth
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //fullName field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      style: const TextStyle(color: ColorText.secondary),
      validator: (value) {
        RegExp regex = RegExp(r'^[A-Z-a-z]{1,}$');
        if (value!.isEmpty) {
          return ("Please enter first name");
        }
        if (!regex.hasMatch(value)) {
          return ("No Special Characters");
        }
        return null;
      },
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: "First Name",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //lastName field
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameController,
      keyboardType: TextInputType.name,
      style: const TextStyle(color: ColorText.secondary),
      validator: (value) {
        RegExp regex = RegExp(r'^[A-Z-a-z]{1,}$');
        if (value!.isEmpty) {
          return ("Please enter last name");
        }
        if (!regex.hasMatch(value)) {
          return ("No Special Characters");
        }
        return null;
      },
      onSaved: (value) {
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: "Last Name",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: ColorText.secondary),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Email");
        }
        // register expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+[@]+[gmail]+[.]+[com]").hasMatch(value)) {
          return ("Gmail is the only valid email address.");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(FontAwesomeIcons.envelope),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: "Email",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //Password field
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
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
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

    //Password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: _obscureText,
      style: const TextStyle(color: ColorText.secondary),
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Password mismatch";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
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
        labelText: "Confirm Password",
        labelStyle: const TextStyle(color: ColorText.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    //register button
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: ColorText.accent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        minWidth: 200,
        onPressed: () {
          register(emailController.text, passwordController.text);
        },
        child: const Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: ColorText.secondary,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: ColorText.primary,
      appBar: AppBar(
        backgroundColor: ColorText.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft,
              color: ColorText.secondary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: ColorText.primary,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 170,
                      child: Image.asset(
                        "assets/iLTGoLogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 25),
                    firstNameField,
                    const SizedBox(height: 15),
                    lastNameField,
                    const SizedBox(height: 15),
                    emailField,
                    const SizedBox(height: 15),
                    passwordField,
                    const SizedBox(height: 15),
                    confirmPasswordField,
                    const SizedBox(height: 25),
                    registerButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireBase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireBase() async {
    //calling the cloud firestore
    // sending the date from server
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserClass userClass = UserClass();

    //writing the value to send in server
    userClass.email = user!.email;
    userClass.uid = user.uid;
    userClass.firstName = firstNameController.text;
    userClass.lastName = lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userClass.toMap());
    Fluttertoast.showToast(msg: "Account created successfully!");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const MainPages()),
        (route) => false);
  }
}
