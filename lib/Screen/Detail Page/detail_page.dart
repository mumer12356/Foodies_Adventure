import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Cart_Page/CartPage.dart';
import '../../Favorite_detail/favorite_detail.dart';
import '../../Favorite_detail/favorite_provider.dart';
import '../../components/constrain.dart';
import '../../constructor/Home.dart';
import 'SpecialInstruction.dart';

class DetailPage extends StatefulWidget {

  final Home home;

  const DetailPage({super.key,required this.home});

  static List<Home> cartItems=[];
  //static List<Food> cartItem=[];



  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int _quantity=1;



  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(widget.home.image,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            buttonArrow(context),

            DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 1.0,
              minChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(2),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Padding(padding: EdgeInsets.only(top: 10,bottom: 25),
                        ),
                        Row(
                          children: [
                            Text(widget.home.texts,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: KBlackColor,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            const Spacer(),
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: widget.home.tprice2,
                                      style: TextStyle(
                                          color: KBlackColor,
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 15
                                      )
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Text(widget.home.tprice3,
                                    style: TextStyle(
                                        color: KBlackColor,
                                        fontSize: 15
                                    )
                                ),
                              ],
                            ),

                          ],
                        ),


                        OutlinedButton.icon(
                            onPressed: () {
                              final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);

                              if (!favoriteProvider.isFavorite(widget.home)) {
                                favoriteProvider.addToFavorites(widget.home);
                              }
                              else{
                                favoriteProvider.dispose();
                              }
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => const FavoriteDetail(
                                        //home: widget.home,

                                    ),)
                              );
                            },
                            icon: Icon(
                              favoriteProvider.isFavorite(widget.home)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            label: Text(widget.home.likes)),
                        const SizedBox(height: 10,),
                        Text(widget.home.textdes,
                          style: const TextStyle(fontSize: 20),
                        ),

                        const SizedBox(height: 10,),
                        Text(widget.home.delivery,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: DeepPurpleColor
                            )
                        ),
                        const SizedBox(height: 15,),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 5,
                            thickness: 5,
                          ),
                        ),
                        Text('Description',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: KBlackColor
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(widget.home.description,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: KBlackColor
                            )
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 5,
                            thickness: 5,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        const specialInstruction(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.purple.shade200,
            boxShadow: [BoxShadow(
              color: KBlackColor,
              blurRadius: 5,
              spreadRadius: 2
            )],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: 150,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: GreyColor,
                        child: const Icon(Icons.remove),
                      ),
                      onTap: (){
                        setState(() {
                          if (_quantity > 1) {
                            _quantity--;
                          }
                        });
                      },
                    ),
                    Text("$_quantity",
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    InkWell(
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: DeepPurpleColor,
                        child: Icon(Icons.add),
                      ),
                      onTap: (){
                        setState(() {

                        _quantity++;

                        });
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                       setState(() {
                         DetailPage.cartItems.add(widget.home);
                       });
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => CartPage(
                           cartItems: DetailPage.cartItems,
                           //cartProvider: HomePage.cartProvider,
                         ),
                         ),
                       );
                      },
                      child: const Text('Add to Cart'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



buttonArrow(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 55,
        width: 40,
        decoration: BoxDecoration(
          color: WhitetColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            height: 55,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(Icons.arrow_back_ios,
            size: 20,
              color: KBlackColor,
            ),
          ),
        ),
      ),
    ),
  );
}






