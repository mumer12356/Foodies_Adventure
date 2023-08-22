import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import '../../Checkout_Page/Order_Page.dart';
import '../../Drawer_Detail/InviteFriends/Invite_friend.dart';
import '../../Drawer_Detail/Privacy/Privacy.dart';
import '../../Drawer_Detail/Pro_Eat/EatlikeaPro.dart';
import '../../Drawer_Detail/Profile_information.dart';
import '../../Drawer_Detail/Setting_page.dart';
import '../../Favorite_detail/favorite_detail.dart';
import '../../Login/login.dart';
import '../../chat/Direct_Message.dart';
import '../../components/constrain.dart';
import '../Detail Page/detail_page.dart';
import 'CatogeriesList.dart';
import 'HomeAppBar.dart';
import 'Seafood.dart';
import 'Vip.dart';


class HomePage extends StatefulWidget {



  const HomePage({Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleCartClearing();
  }

  void _handleCartClearing(){
    if(DetailPage.cartItems.isEmpty){
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                        accountName: Text('Foodies Adventure',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      accountEmail: Text('foodiesadventure786@etc.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 15,
                        ),
                      ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),
              ),


              //Eat like a Pro
              ListTile(
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProEat(),));
                },
                leading: Image.asset(
                  'assets/images/img.png',
                  height: 40,
                   // width: 30,
                  color: Colors.deepPurple,
                ),
                title: const Text('Eat Like a Pro',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),


              // Profile
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:
                    (context) => const ProfileInfo(),)
                  );
                },
                child: const ListTile(
                  leading: Icon(
                      Icons.person,
                    color: Colors.deepPurple,
                  ),
                  title: Text('Profile Information',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Order
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrderDetail(
                      totalPrice: 0.0,
                      deliveryFee: 50,
                      quantities: const [],
                      cartItems: const [],
                    ),)
                  );
                },
                leading: const Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.deepPurple,
                ),
                title: const Text('My Orders',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),

              //Favorite
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FavoriteDetail(
                       // home: home,
                    ),)
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.deepPurple,
                  ),
                  title:
                  Text('My WishList',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Help
              ListTile(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DirectMessage()),
                  );
                },
                leading: const Icon(
                  Icons.help_center,
                  color: Colors.deepPurple,
                ),
                title: const Text('Help Centre',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),


              //Invite Friends
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Invite(),)
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    CupertinoIcons.gift,
                    color: Colors.deepPurple,
                  ),
                  title: Text('Invite Friends',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //Logout
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginPage(),)
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.deepPurple,
                  ),
                  title: Text('Log out',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              const SizedBox(height: 20,),
              const Divider(thickness: 4),

              //Setting
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Setting(),)
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.deepPurple,
                  ),
                  title: Text('Settings',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Privacy(),
                    ),

                  );
                },
                leading: const Icon(
                  Icons.privacy_tip,
                  color: Colors.deepPurple,
                ),
                title: const Text('Terms & Condition / Privacy',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
          //drawerEnableOpenDragGesture: true,

          body: ListView(
          children: [
            const HomeAppBar(),

            Container(
              //height: 600,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          //height: 50,
                          width: 100,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Here......'
                            ),
                          ),
                        ),
                        // Spacer(),
                        // Icon(Icons.camera_alt_outlined,
                        //   size: 27,
                        //   color: Color(0xFF4C53A5),
                        // ),
                      ],
                    ),
                  ),


                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical:15,
                      horizontal: 10,
                    ),
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),


                  const CatogoriesList(),

                ],
              ),
            ),

            const SizedBox(height: 20,),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: const Text('VIP',style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5) ),)),

            const SizedBox(height: 10,),
            Vip(),

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(
                vertical:15,
                horizontal: 10,
              ),
              child: const Text(
                'Sea Food',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            const SizedBox(height: 10,),

            SeaFood(),
          ],
        ),
      
      floatingActionButton: SizedBox(
        height: 70,
        width:  70,
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: DeepPurpleColor,
          child: IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DirectMessage(),)
                );
              },
              icon: const Icon(Icons.chat_outlined)),
        ),
      ),
      ),
    );
  }
}
