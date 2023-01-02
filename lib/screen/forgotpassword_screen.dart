import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              child: InkWell(
                onTap: () {
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                          'Don\'t worry! it occurs. Please enter the email address linked with your account.',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
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
            
            //forgot password
           
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Container(
                  height: 65,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
            
      
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 600),
              child: Row(
                children: [
                  Text('Remember Password? ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue, fontSize: 25),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
