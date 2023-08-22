import 'package:flutter/material.dart';
import 'package:foodies_adventure/Screen/HomePage/HomePage.dart';
import '../components/constrain.dart';
import 'chat.dart';


class DirectMessage extends StatelessWidget {
  const DirectMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KWhitetColor,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage(),)
            );
          },
          child: const Icon(
            Icons.cancel,
            color: DeepPurpleColor,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text('How can we help?',style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,color: KBlackColor),),
      ),
      body: Column(children: [
        SizedBox(height: size.height*0.05,),


        //My Account
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(initialMessage: 'My Account'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width*0.04,),
              const Icon(Icons.account_circle),

              const SizedBox(width: 10,),
              const Text('My Account',style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp,color: DeepPurpleColor,),
            ],
          ),
        ),



        const SizedBox(height: 20,),
        const Divider(thickness: 2,),


        const SizedBox(height: 20,),

        //Payment and refunds
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(initialMessage: 'Payment and refunds'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width*0.04,),
              const Icon(Icons.payment),

              const SizedBox(width: 10,),
              const Text('Payment and refunds',style: TextStyle(fontSize: 20,)),
              const Spacer(),
              InkWell(
                onTap: (){},
                child: const Icon(Icons.arrow_forward_ios_sharp,color: DeepPurpleColor,),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),


        const SizedBox(height: 20,),

        //Get help with my orders
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(initialMessage: 'Get help with my orders'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width*0.04,),
              const Icon(Icons.shopping_bag_outlined),

              const SizedBox(width: 10,),
              const Text('Get help with my orders',style: TextStyle(fontSize: 20,)),
              const Spacer(),
              InkWell(
                onTap: (){},
                child: const Icon(Icons.arrow_forward_ios_sharp,color: DeepPurpleColor,),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),


        const SizedBox(height: 20,),

        //My Support Request
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(initialMessage: 'My Support Request'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width*0.04,),
              const Icon(Icons.email),

              const SizedBox(width: 10,),
              const Text('My Support Request',style: TextStyle(fontSize: 20,)),
              const Spacer(),
              InkWell(
                onTap: (){},
                child: const Icon(Icons.arrow_forward_ios_sharp,color: DeepPurpleColor,),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),


        const SizedBox(height: 20,),

        //Others
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(initialMessage: 'Others'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width*0.04,),
              const Icon(Icons.account_circle),

              const SizedBox(width: 10,),
              const Text('Others',style: TextStyle(fontSize: 20,)),
              const Spacer(),
              InkWell(
                onTap: (){},
                child: const Icon(Icons.arrow_forward_ios_sharp,color: DeepPurpleColor,),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 1,),
      ]
      ),

    );
  }
}
