import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screen/HomePage/HomePage.dart';
import '../components/constrain.dart';
import '../constructor/Home.dart';
import 'favorite_provider.dart';


class FavoriteDetail extends StatelessWidget {
  ////final Home home;


  const FavoriteDetail({Key? key,
   // required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final List<Home> favoriteItems = favoriteProvider.favoriteItems;




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KWhitetColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage(

                  ),));
            },
            child: const Icon(
              Icons.arrow_back,
              color: DeepPurpleColor,
              size: 30,
            ),
          ),
          title: Text(
            'Favorites',
            style: TextStyle(color: KBlackColor),
          ),

        ),

        body: ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final Home favoriteHome = favoriteItems[index];
            return Container(
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Container(
                    color: KWhitetColor,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: 350,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple.shade50,
                        image: DecorationImage(image: AssetImage(favoriteHome.image,),
                        fit: BoxFit.cover
                        ),
                      ),
                      // ... Customize the appearance of the container for each favorite item
                      child: Column(
                        children: [
                          const Text('Best Deal',
                            style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration(
                              color: KWhitetColor,

                            ),
                            child: Row(
                              children: [
                              Text(favoriteHome.delivery,
                                style: const TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.star,color: Colors.orange),
                              Text(favoriteHome.rating,
                                style: const TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              IconButton(onPressed: (){
                                favoriteProvider.removeFromFavorites(favoriteHome);
                              },
                                  icon: const Icon(Icons.cancel_presentation)),
                              ],
                            ),
                          ),
                          // SizedBox(width: 20,),
                          // Text(favoriteHome.delivery,
                          //   style: TextStyle(
                          //       fontSize: 15,fontWeight: FontWeight.bold),
                          // ),
                          // SizedBox(width: 180,),
                          // Icon(Icons.star,color: Colors.orange),
                          // Text(favoriteHome.rating,
                          //   style: TextStyle(
                          //       fontSize: 15,fontWeight: FontWeight.bold),
                          // ),
                          // IconButton(onPressed: (){
                          // },
                          //     icon: Icon(Icons.cancel_presentation)),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}