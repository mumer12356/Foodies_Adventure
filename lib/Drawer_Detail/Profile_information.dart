import 'package:flutter/material.dart';

import '../Screen/HomePage/HomePage.dart';
import '../components/constrain.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KWhitetColor,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage(
                ),)
              );
              },
            child: const Icon(
              Icons.cancel_outlined,color: DeepPurpleColor,size: 25,)),
      title: Text('Profile',
      style: TextStyle(color: KBlackColor),
      ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Name
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(20),
              height: size.height*0.13,
              width: size.width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: KWhitetColor,
                boxShadow: [BoxShadow(
                  //offset: Offset(1, 1),
                  color: KBlackColor,
                  spreadRadius: 2,blurRadius: 2
                )]
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Name',
                      style: TextStyle(fontSize: 17),),
                      // SizedBox(
                      //   width: size.width*0.67,
                      // ),
                      Spacer(),
                      Icon(Icons.edit_outlined,color: DeepPurpleColor,)
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Text('Muhammad Umer',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //Email
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(20),
              height: size.height*0.13,
              width: size.width*1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KWhitetColor,
                  boxShadow: [BoxShadow(
                    //offset: Offset(1, 1),
                      color: KBlackColor,
                      spreadRadius: 2,blurRadius: 2
                  )]
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Email',
                        style: TextStyle(fontSize: 17),),
                      // SizedBox(
                      //   width: size.width*0.67,
                      // ),
                      Spacer(),
                      Icon(Icons.edit_outlined,color: DeepPurpleColor,)
                    ],
                  ),
                  Flexible(
                    child: Text('mu3408493@gmail.com',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            // Mobile Number
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(20),
              height: size.height*0.13,
              width: size.width*1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KWhitetColor,
                  boxShadow: [BoxShadow(
                    //offset: Offset(1, 1),
                      color: KBlackColor,
                      spreadRadius: 2,blurRadius: 2
                  )]
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Mobile number',
                        style: TextStyle(fontSize: 17),),
                      // SizedBox(
                      //   width: size.width*0.50,
                      // ),
                      Spacer(),
                      Icon(Icons.edit_outlined,color: DeepPurpleColor,)
                    ],
                  ),
                  Flexible(
                    child: Text('03170206476',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //Connected Account
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                children: [
                  Text('Connected Account',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //Facebook
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(20),
              height: size.height*0.10,
              width: size.width*1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KWhitetColor,
                  boxShadow: [BoxShadow(
                    //offset: Offset(1, 1),
                      color: KBlackColor,
                      spreadRadius: 2,blurRadius: 2
                  )],
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.facebook,color: DeepPurpleColor,),
                      SizedBox(width: 20,),
                      Text('Facebook',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(width: 130,),
                      Spacer(),
                      Text('Connect',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                        color: DeepPurpleColor
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            //Google
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(20),
              height: size.height*0.10,
              width: size.width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: KWhitetColor,
                boxShadow: [BoxShadow(
                  //offset: Offset(1, 1),
                    color: KBlackColor,
                    spreadRadius: 2,blurRadius: 2
                )],
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage('assets/images/google.png',
                      ),
                      height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 20,),
                      Text('Google',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(width: 150,),
                      Spacer(),
                      Text('Connect',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            color: DeepPurpleColor
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
