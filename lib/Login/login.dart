import 'package:flutter/material.dart';
import 'package:foodies_adventure/Login/validation.dart';

import '../Screen/HomePage/HomePage.dart';
import '../Screen/Signup/sign_up.dart';
import '../components/constrain.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginkey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  bool passToggle=true;

  Pattern emailPattern=Valid.email;
  RegExp? email;

  Pattern passPattern=Valid.password;
  RegExp? pass;


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              alignment: Alignment.topLeft,
              //color: Colors.grey,
              height: size.height*0.2,
              child: Image.asset("assets/images/main_top.png",
                width: size.width*0.25,alignment: Alignment.topLeft,
                //height: size.height*0.5,
              ),
            ),


            SizedBox(
              height: size.height*0.4,
              //color: Colors.pink,
              child: Image.asset('assets/images/4.jpg',
                height: size.height*0.3,
              ),
            ),


            const SizedBox(height: 40,),

            Form(
              key: _loginkey,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: size.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 30-10),
                child: Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_rounded),
                        labelText: 'Email',
                        hintText: 'Email',
                        fillColor: Colors.grey[400],
                        filled: true,
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        email = RegExp(emailPattern.toString());
                        bool equal=RegExp(r"umer123@gmail.com").hasMatch(value!);
                        if (value.toString().isEmpty) {
                          return 'Enter Email';
                        } if(email!.hasMatch(equal.toString())){
                          return 'Successful';
                        }
                         if (email!.hasMatch(value)) {
                          return 'Enter Valid Email';
                        }
                        return null; // No validation error, return null.
                      },

                    ),

                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        labelText: 'Password',
                        hintText: 'Password',
                        fillColor: Colors.grey[400],
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                passToggle= !passToggle;
                              });
                            },
                            icon: Icon(
                                color: Colors.deepPurple,
                                passToggle?
                                Icons.visibility : Icons.visibility_off_outlined
                            ),
                        ),

                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      controller: passController,
                      obscureText: passToggle,

                      validator: (value) {
                        pass = RegExp(passPattern.toString());
                        bool equal=RegExp(r"umer12345").hasMatch(value!);
                        if (value.toString().isEmpty) {
                          return 'Enter Password';
                        } else if (pass!.hasMatch(value)) {
                          return 'Enter Valid Password';
                        } if(pass!.hasMatch(equal.toString())){
                          return 'Successful';
                        }
                        else if (value.length < 6) {
                          return "Password length should be at least 6 characters";
                        }
                        return null; // No validation error, return null.
                      },

                    ),
                    const SizedBox(height: 2,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){},
                        child: const Text('Forget Password ?'),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Login',
                          style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w500,
                          ),
                        ),
                        CircleAvatar(
                          child: IconButton(
                              color: WhitetColor,
                              onPressed: () {
                                if (_loginkey.currentState!.validate()) {
                                  // The form is valid, proceed to navigate to HomePage.

                                  emailController.clear();
                                  passController.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                  );
                                }
                              },
                              icon: const Icon(Icons.arrow_forward_ios_sharp,
                                //color: Colors.deepPurple,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width*0.45,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/google.png',
                              width: 25
                            ),
                            label: Text('Google ',
                              style: TextStyle(
                                color: KBlackColor,
                              )
                              ,)
                            ,),
                        ),
                        SizedBox(
                          width: size.width*0.40,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/facebook.png',
                              width: 30,
                            ),
                            label: Text('Facebook ',
                              style: TextStyle(
                                color: KBlackColor,
                              )
                              ,)
                            ,),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 45,
                      // width: 250,
                      child: Center(
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const SignUp(),)
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              text: " Don't Have an Account ?  ",
                              style: Theme.of(context).textTheme.bodyLarge,
                              children:  [
                                TextSpan(
                                  text: 'Sign  Up',
                                  style: TextStyle(
                                    color: BlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/login_bottom.png',
                width: size.width*0.4,//alignment: Alignment.bottomRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
