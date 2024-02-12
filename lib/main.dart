import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter/constant.dart';
import 'package:twitter/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final RegExp emailValid = RegExp(
        "[a-zA-Z0-9.a-zA-Z0-9 .! #%&'*+-/ =? ^_'{| }~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordControllr = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(AppImages.logo),
                  width: 100,
                ),
                const Text(
                  "Login in to Twitter",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  // color: Colors.amber,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter email";
                      } else if (!emailValid.hasMatch(value)) {
                        return "please enter valid email";
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter your Email",
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      contentPadding: const EdgeInsets.only(left: 30),
                    ),
                  ),
                ),
                //!============================passwordfield==========================

                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " please enter your number";
                      } else if (value.length < 6) {
                        return "password at least 6 charactre";
                      }
                    },
                    controller: passwordControllr,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter your password",
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      contentPadding: const EdgeInsets.only(left: 30),
                    ),
                  ),
                ),
                //==================================

                Container(
                  width: 250,
                  decoration: const BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint(" ${emailController.text}");
                          debugPrint(" ${passwordControllr.text}");
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const SignUp()));
                    },
                    child: const Text(
                      "Don't have an account, signup here",
                      style: TextStyle(color: AppColor.primary),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
