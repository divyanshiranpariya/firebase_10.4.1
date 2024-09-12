import 'package:flutter/material.dart';

import '../../utils/auth_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () async {
                  Map<String, dynamic> res =
                      await AuthHelper.authHelper.signInAsGeustUser();
                  if (res['user'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Login Sucessfully"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.of(context)
                        .pushReplacementNamed('/', arguments: res['user']);
                  } else if (res['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(" Login failed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text("Anonymously login")),
            OutlinedButton(
                onPressed: () {
                  signUpUser();
                },
                child: Text("Sign Up")),
            OutlinedButton(
                onPressed: () {
                  signInUser();
                },
                child: Text("Sign In")),
            OutlinedButton(
                onPressed: () async {
                  Map<String, dynamic> res =
                      await AuthHelper.authHelper.signInWithGoogle();
                  if (res['user'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Google with Login Sscessfully"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.of(context)
                        .pushReplacementNamed('/', arguments: res['user']);
                  } else if (res['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Google with Login failed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text("Login with google"))
          ],
        ),
      ),
    );
  }

  signUpUser() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sign Up"),
          content: Form(
            key: signUpFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Email...";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email ",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Password";
                    } else if (val.length <= 6) {
                      return "Password must Contain 6 Letters";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    password = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password Here",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.security),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                emailController.clear();
                passwordController.clear();
                email = null;
                password = null;
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (signUpFormKey.currentState!.validate()) {
                  signUpFormKey.currentState!.save();

                  Map<String, dynamic> res = await AuthHelper.authHelper
                      .SignUp(email: email!, password: password!);

                  if (res['user'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Sign Up Sucessfully"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.of(context)
                        .pushReplacementNamed('/', arguments: res['user']);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Sign Up failed",
                      ),
                      backgroundColor: Colors.red,
                    ));
                  }
                  emailController.clear();
                  passwordController.clear();
                  email = null;
                  password = null;
                  Navigator.of(context).pop();
                }
              },
              child: Text("Sign Up"),
            ),
          ],
        );
      },
    );
  }

  signInUser() {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text("Sign In"),
            content: Form(
              key: signInFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Email...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Email ",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Password";
                      } else if (val.length <= 6) {
                        return "Password must Contain 6 Letters";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      password = val;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Password Here",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.security),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();
                  email = null;
                  password = null;
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  if (signInFormKey.currentState!.validate()) {
                    signInFormKey.currentState!.save();
                    Map<String, dynamic> res = await AuthHelper.authHelper
                        .signInWithEmailAndPassword(
                            email: email!, password: password!);

                    if (res['user'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Sign Up Sucessfully"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.of(context)
                          .pushReplacementNamed('/', arguments: res['user']);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Sign Up failed",
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                    emailController.clear();
                    passwordController.clear();
                    email = null;
                    password = null;
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Sign In"),
              ),
            ],
          ),
        );
      },
    );
  }
}
