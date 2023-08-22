import 'package:flutter/material.dart';
import '../../components/constrain.dart';
import 'Invite_friend.dart';

class Works extends StatelessWidget {
  const Works({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Invite(),)
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back,size: 30,color: DeepPurpleColor,)),
              const SizedBox(height: 50,),

              const Text('How it works',
                style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(1),
                child: Text('Share your invite link with friends. Once they sign'
                    'up for a free account with your link, a fee voucher is automatically'
                    'applied at checkout for them. After they place their first order,'
                    'your voucher will be sent to you and automatically applied'
                    'at checkout for you',textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 19),
                ),
              ),

              const SizedBox(height: 20,),

              Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: KBlackColor,
                      ),

                      const Text('Offer valid on restaurant order of',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                    ],
                  ),
                  const Text('first order or more',
                    style: TextStyle(
                        fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: KBlackColor,
                      ),
                      //SizedBox(width: 20,),
                      const Text('You can invite up to 10 friends ',
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                    ],
                  ),
                  const Text('who have never made a restaurant order on foodies before',
                    style: TextStyle(
                        fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: KBlackColor,
                      ),
                      //SizedBox(width: 20,),
                      const Text('Your voucher expires 30 days ',
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                    ],
                  ),
                  const Text('after ypu receive it',
                    style: TextStyle(
                        fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: KBlackColor,
                      ),
                      //SizedBox(width: 20,),
                      const Text('Your friends voucher expires ',
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                    ],
                  ),
                  const Text('30 days after they have sign up',
                    style: TextStyle(
                        fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 50,),
          ],
        ),
        ),
      ),
    );
  }
}
