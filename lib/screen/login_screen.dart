import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnfirebase/screen/homescreen.dart';
import 'package:learnfirebase/screen/register_screen.dart';
import 'package:learnfirebase/services/auth_services.dart';

import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  Future<void> logIn() async{
    try{
      await AuthServices().signIn(emailController.text, passwordController.text);


    }
    on FirebaseException catch(e){
      setState(() {
        errorMessage = e.message;
      });

    }
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: InkWell(onTap: () {
                Navigator.pop(context);
              },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)]),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Welcome back! Glad to see you, Again!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 91, 91, 91),
                              fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 91, 91, 91),
                              fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(onTap: () async{
               await logIn();
               if(errorMessage != null){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage!)));
               }
               
              },
                child: Container(
                    height: 65,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    'Or Login with',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //facebook, google, apple in row inside container
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: SvgPicture.asset('asset/facebook.svg',height: 40,width: 40,color: Colors.blue,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: InkWell(
                      onTap: () {
                        AuthServices().logininwithgoogle();
                      },
                      child: Container(
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 1)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('asset/google.svg'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 20),
                    child: Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: SvgPicture.asset('asset/apple.svg',height: 40,width: 40,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 300),
              child: Row(children: [
                Text('Don\'t have an account? ',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
                  child: Text('Register Now',style: TextStyle(color: Colors.blue,fontSize: 25),))
              ],),
            )
                  ],
                ),
          )),
    );
  }
}
