import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/constrain.dart';


class ProEat extends StatefulWidget {
  const ProEat({Key? key}) : super(key: key);

  @override
  State<ProEat> createState() => _ProEatState();
}

class _ProEatState extends State<ProEat> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: DeepPurpleColor,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.cancel_rounded,size: 35,color: KWhitetColor,),
                        ),
                        onPressed: () {
                          // Implement cancel button functionality here
                        },
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to EatPro!',
                          style: TextStyle(
                              color: WhitetColor,
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The all-in-one plan you need to unlock '
                              'exclusive benefit ',
                          style: TextStyle(fontSize: 16,color: WhitetColor),
                        ),
                        Text(
                          'Eat like a pro and stay healthy! ',
                          style: TextStyle(fontSize: 16,color: WhitetColor),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Container(
                height: 250,
                width: 100,
                color: Colors.deepPurpleAccent.shade100,
                //padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Image.asset(
                  'assets/images/avatar.jpg', // Replace with your actual image path
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 100,
                color: Colors.deepPurpleAccent.shade100,
                child: const Column(
                  children: [
                    Column(
                      children: [
                        Text('Subscribe now and saves ',
                        style: TextStyle(fontSize: 16,color: DeepPurpleColor),
                        ),
                        SizedBox(height: 20,),
                        Text('Enjoy 35% discount on 12 month ',
                        style: TextStyle(fontSize: 16,color: DeepPurpleColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Become a Pro to enjoy',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20,),

              //free delivery
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(CupertinoIcons.checkmark_alt_circle_fill,
                        color: DeepPurpleColor,
                        ),
                        SizedBox(width: 20,),
                        Text('Free delivery',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),

                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Valid with min. order of Rs. 500 for',
                          ),
                          const Text('restaurants, Rs. 1000'
                              'for shops',
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 130,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade400,
                                ),
                                child: const Center(child: Text('10 order/month')),
                              ),
                              //SizedBox(width: 130,),
                              const Spacer(),
                              Image.asset('assets/pro_images/delivery_free.png',
                                width: 80,
                                height: 80,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),


              //second offer
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(CupertinoIcons.checkmark_alt_circle_fill,
                          color: DeepPurpleColor,
                        ),
                        SizedBox(width: 20,),
                        Text('Free delivery',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),

                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Valid with min. order of Rs. 500 for',
                          ),
                          const Text('restaurants, Rs. 1000'
                              'for shops',
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 130,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade400,
                                ),
                                child: const Center(child: Text('10 order/month')),
                              ),
                              const Spacer(),
                              Image.asset('assets/pro_images/delivery_free.png',
                                width: 80,
                                height: 80,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        ),

        bottomNavigationBar: SizedBox(
          height: 80,
          //color: DeepPurpleColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Starting from',
                    style: TextStyle(fontSize: 16,color: KBlackColor),
                  ),

                  // SizedBox(width: 120,),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(150, 20)
                      ),
                      backgroundColor: MaterialStateProperty.all(DeepPurpleColor)
                    ),
                      onPressed: (){
                      },
                      child: const Text('Select Plan'))
                ],
              ),
              Text('Rs. 166.50/mo.',
                style: TextStyle(fontSize: 16,color: KBlackColor),
              ),
            ],
          ),
        ),

      ),
    );
  }
}


