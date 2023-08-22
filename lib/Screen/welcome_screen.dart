import 'package:flutter/material.dart';

import '../Login/login.dart';
import 'Signup/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLogin=false;
  bool isSignup=false;

  void handleLoginClicked(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginPage(),)
    );
  }
  void handleSignUpClicked(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SignUp(),)
    );
  }
  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    // double width = size.width;
    // double height = size.height;

    return Scaffold(
      body: Column(
        children: [
        Container(
          height: size.height*0.19,
          alignment: Alignment.topLeft,
          child: Image.asset("assets/images/main_top.png",
            //width: size.width * 0.3,
          ),
        ),

        Container(
          alignment: Alignment.topCenter,
          height: size.height*0.65,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),

              Container(
                alignment: Alignment.center,

                height: size.height*0.1 ,
                child: const Text('Welcome to My Food',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                alignment: Alignment.center,
                height: size.height*0.2,

                child: Image.asset('assets/images/download.png',
                    width: size.width*0.5,
                  ),
              ),
               const SizedBox(height: 10),

              Container(
                height: size.height*0.11,
                alignment: Alignment.center,

                child: OutlinedButton.icon(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 15),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                            vertical: 12 , horizontal:size. width * 0.1)),
                    ),
                    onPressed: (){
                      if(!isLogin){
                        setState(() {
                          isLogin=true;
                          isSignup=false;
                        });
                        handleLoginClicked();
                      }
                    },
                    icon:const Icon(Icons.login_outlined,size: 25,),
                    autofocus: true,
                    label: const Text('Login',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
              ),
               const SizedBox(height: 10,),

              Container(
                height: size.height*0.11,
                alignment: Alignment.center,

                child:
                ElevatedButton.icon(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 10),
                      ),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 13, horizontal: size.width * 0.1)
                      ),
                    ),
                    icon: const Icon(Icons.account_circle,size: 20),
                    label: const Text('Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      if(!isSignup){
                        setState(() {
                          isSignup=true;
                          isLogin=true;
                        });
                        handleSignUpClicked();
                      }
                    }
                ),
              ),
            ],
          ),
        ),


        Container(

          height: size.height*0.16 ,
          alignment: Alignment.bottomLeft,
          child:Image.asset("assets/images/main_bottom.png",
            //width: size.width * 0.3,
          ),
        ),
        ],
    ),
    );
  }
}
