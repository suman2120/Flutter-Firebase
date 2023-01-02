import 'package:flutter/material.dart';
import 'package:learnfirebase/screen/register_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/img.png'), fit: BoxFit.contain)),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/Branding.png'),
                    fit: BoxFit.contain),
              ),
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:((context) => RegisterScreen())));
              },
                child: Container(
                    height: 65,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0,top: 10),
              child: Text(
                'Continue as a guest',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 29, 189, 200),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
