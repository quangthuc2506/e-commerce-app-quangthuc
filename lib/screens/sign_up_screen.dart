import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/values/app_assets.dart';
import 'package:e_commerce_app/values/app_colors.dart';
import 'package:e_commerce_app/widgets/button_floating_login.dart';
import 'package:e_commerce_app/widgets/text_change_screen.dart';
import 'package:e_commerce_app/widgets/login_integrated.dart';
import 'package:e_commerce_app/widgets/my_text_form_field.dart';
import 'package:e_commerce_app/widgets/text_forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class _SignUpScreenState extends State<SignUpScreen> {
  
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }
  bool obscureText = true;
  String email="";
  String password="";
  void validation() async {
    final FormState _form = _formKey.currentState!;
    if (!_form.validate()) {
      try {
        var result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user!.uid);
      } on PlatformException catch (e) {
        ScaffoldMessenger.of(_scaffoldKey.currentContext!)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } else {}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.homePage), fit: BoxFit.fill)),
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 420,
              width: 360,
              padding:const EdgeInsets.symmetric(horizontal: 5),
              margin:const EdgeInsets.only(bottom: 1, left: 21, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.xanhDam),
                  ),
                  MyTextFormField(
                    icon:const Icon(Icons.person),
                    hintText: "Enter your name",
                    label:const Text("Username"),
                    validator: (value) {
                      if (value == "") {
                        return "Please enter your username.";
                      } else if (value!.length < 8) {
                        return "Username must be 6 characters or more.";
                      } else {
                        return "";
                      }
                    },
                  ),
                  MyTextFormField(
                    onchanged: (value){
                      email = value!;
                    },
                    icon:const Icon(Icons.email),
                    label:const Text("Email"),
                    hintText: "Enter your email",
                    validator: (value){
                      if(value==""){
                        return "Please enter your username.";
                      }
                      else if(!regExp.hasMatch(value!)){
                        return "Email is invalid!";
                      }
                      else {return "";}
                    },
                  ),
                  MyTextFormField(
                    onchanged: (value){
                      password = value!;
                    },
                    validator: (value) {
                      if (value == "") {
                        return "Please enter your password.";
                      } else if (value!.length < 8) {
                        return "Password must be 8 characters or more.";
                      } else {
                        return "";
                      }
                    },
                    icon:const Icon(Icons.lock_rounded),
                    label:const Text("Password"),
                    hintText: "Enter your password",
                    obsText: obscureText,
                    suffixIcon: GestureDetector(
                      child: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                   TextForgotPass(
                    onTap: (){
                      print("Clicked forgot pass!");
                    } ,
                  ),
                  Row(
                    children: [
                      ButtonIntegrated(
                        icon: AppAssets.googleLogo,
                        onPressed: () {},
                      ),
                      ButtonIntegrated(
                        icon: AppAssets.facebookLogo,
                        onPressed: () {},
                      ),
                      ButtonIntegrated(
                        icon: AppAssets.apple,
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextChangeScreen(
                    what: "I Have an account! ",
                    whereTo: "Login",
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteName.loginScreen, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: ButtonFloatingLogin(
          text: "Register",
          onPress: (){
            validation();
          },
        ));
  }
}
