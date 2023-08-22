
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

import '../../Cart_Page/CartPage.dart';
import '../Detail Page/detail_page.dart';


class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool showCartBadge = DetailPage.cartItems.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

              IconButton(
                icon: const Icon(Icons.dashboard,
                  size: 35,
                  color: Color(0xFF4C53A5),
                ), onPressed: () {
                  Scaffold.of(context).openDrawer();
              },
              ),


          const Padding(
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Text('My Food',
              style: TextStyle(
                fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5),
              ),),
          ),
          const Spacer(),
          if(showCartBadge)
          Badge(
            badgeColor: Colors.red,
            padding:const EdgeInsets.all(7),
            badgeContent: Text('${DetailPage.cartItems.length}',
              style: const TextStyle(color: Colors.white
              ),),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage(
                         cartItems: DetailPage.cartItems,
                              ),)
                          );
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                  color: Color(0xFF4C53A5),
                ),
            ),
          ),
          if (!showCartBadge) // Show an empty container when no badge needed
            Container(),
        ],
      ),
    );
  }
}
