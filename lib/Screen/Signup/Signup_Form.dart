import 'package:flutter/material.dart';

import '../../Login/login.dart';
import '../../Login/validation.dart';
import '../../components/constrain.dart';


class SignupForm extends StatefulWidget {
  final size;
  const SignupForm({super.key,required this.size});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  final _SignupKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  bool passToggle=true;

  Pattern emailPattern=Valid.email;
  RegExp? email;

  Pattern passPattern=Valid.password;
  RegExp? pass;

  Pattern namePattern = Valid.name;
  RegExp? name;

  Pattern phonePattern = Valid.phone;
  RegExp? phone;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Form(
      key: _SignupKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30-10,horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "Full Name",
                hintText: 'Full Name',
                fillColor: Colors.grey[200],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: GreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DeepPurpleColor),
                ),
              ),
              controller: nameController,
              validator: (value) {
                name = RegExp(emailPattern.toString());
                //bool equal=RegExp(r"umer123@gmail.com").hasMatch(value!);
                if (value.toString().isEmpty) {
                  return 'Enter Email';
                }
                // if(email!.hasMatch(equal!.toString())){
                //   return 'Succesful';
                // }
                if (name!.hasMatch(value!)) {
                  return 'Enter Valid Email';
                }
                return null; // No validation error, return null.
              },
            ),//Name
            const SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_rounded),
                labelText: "Email",
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: GreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DeepPurpleColor),
                ),
              ),
              controller: emailController,
              validator: (value) {
                email = RegExp(emailPattern.toString());
                bool equal=RegExp(r"umer123@gmail.com").hasMatch(value!);
                if (value.toString().isEmpty) {
                  return 'Enter Email';
                } if(email!.hasMatch(equal.toString())){
                  return 'Succesful';
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
                prefixIcon: const Icon(Icons.numbers_sharp),
                labelText: "Phone Number",
                hintText: '0310-2244331',
                fillColor: Colors.grey[200],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: GreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DeepPurpleColor),
                ),
              ),
              controller: phoneController,
              validator: (value) {
                phone = RegExp(emailPattern.toString());
                //bool equal=RegExp(r"03170206476").hasMatch(value!);
                if (value.toString().isEmpty) {
                  return 'Enter Email';
                }
                // if(email!.hasMatch(equal!.toString())){
                //   return 'Succesful';
                // }
                if (phone!.hasMatch(value!)) {
                  return 'Enter Valid Email';
                }
                return null; // No validation error, return null.
              },
            ),
            const SizedBox(height: 10,),

            TextFormField(
              //obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password_sharp),
                labelText: "Password",
                hintText: 'Password',
                fillColor: Colors.grey[200],
                filled: true,
                border: const OutlineInputBorder(),
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: GreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DeepPurpleColor),
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
                  return 'Succesful';
                }
                else if (value.length < 6) {
                  return "Password length should be at least 6 characters";
                }
                return null; // No validation error, return null.
              },
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                const Text('SIGNUP',
                  style: TextStyle(
                    fontSize: 17,fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  child: IconButton(
                      color: WhitetColor,
                      onPressed: () {
                        if (_SignupKey.currentState!.validate()) {
                          // The form is valid, proceed to navigate to HomePage.
                          emailController.clear();
                          passController.clear();
                          phoneController.clear();
                          nameController.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_sharp,)),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width*0.32,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset('assets/images/google.png',
                      width: 25,
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
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Have an Acoount ?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage(),)
                  );
                }, child: Text('Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: BlueColor,
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
