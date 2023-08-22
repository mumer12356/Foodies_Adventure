import 'package:flutter/material.dart';

import 'Signup_Form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/images/signup_top.png",
                width: size.width*0.33,
              ),
            ),

            Container(
              margin: const EdgeInsets.all(0.1),
              child: Padding(
                padding: const EdgeInsets.only(top: 0.1),
                child: Column(

                  children: [
                    const Text('SIGNUP'),
                    Image.asset('assets/images/signup.png',
                      height: size.height*0.26,
                    ),
                    const SizedBox(height: 5,),
                    const Text('Create your profile to start your journey.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SignupForm(size: size,),
            const SizedBox(height: 100,),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/main_bottom.png',
                width: size.width*0.2,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
