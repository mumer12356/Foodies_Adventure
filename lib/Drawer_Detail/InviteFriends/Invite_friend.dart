import 'package:flutter/material.dart';

import '../../Screen/HomePage/HomePage.dart';
import '../../components/constrain.dart';
import 'How _Works.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const HomePage(),)
                      );
                    },
                      child: const Icon(
                        Icons.arrow_back,size: 30,color: DeepPurpleColor,)),
                  //SizedBox(width: 220,),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Works(),)
                      );
                    },
                    child: const Text('How it works ?',
                      style: TextStyle(
                          color:DeepPurpleColor,
                          fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Container(
                height: size.height*0.30,
                margin: const EdgeInsets.only(top: 20,right: 20),
                  child: const Image(
                      image: AssetImage('assets/images/Food Ai pic.png'))),

              const Padding(
                  padding: EdgeInsets.only(top: 40),
                child: Text('Invite Friend, get Rs.400',
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 20),
                child: Text('1. Your friends get Rs. 500',
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ), const Padding(
                  padding: EdgeInsets.only(top: 10),
                child: Text('when they sign up with your invite link',
                  style: TextStyle(
                      fontSize: 15,),
                ),
              ), const Padding(
                  padding: EdgeInsets.only(top: 20),
                child: Text('2. Then you get Rs.400',
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                child: Text('once they place their first order',
                  style: TextStyle(
                      fontSize: 15,),
                ),
              ),
              const SizedBox(height: 80,),

              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(DeepPurpleColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 100),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ),
                  onPressed: (){},
                  child: const Text('Share your Link',
                    style: TextStyle(
                      color: KWhitetColor,
                        fontSize: 20,fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20,),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(KWhitetColor),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 100),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                   side: const BorderSide(
                     color: DeepPurpleColor,width: 10
                   )
                    ),
                  )
                ),
                  onPressed: (){},
                  child: const Text('Scan QR Code',
                    style: TextStyle(
                      color: DeepPurpleColor,
                        fontSize: 20,fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
