
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodies_adventure/Screen/HomePage/popular.dart';
import 'package:http/http.dart'as http;
import '../../components/constrain.dart';
import '../../constructor/Home.dart';
import '../Detail Page/detail_page.dart';
import 'Category_model.dart';


class CatogoriesList extends StatefulWidget {
  const CatogoriesList({Key? key}) : super(key: key);

  @override
  State<CatogoriesList> createState() => _CatogoriesListState();
}

class _CatogoriesListState extends State<CatogoriesList> {

  List<Categories> categories=[];

  Future CategotyData() async{
    var uri=Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    print('URL : $uri');
    var response = await http.get(uri);
    print('Status Code: ${response.statusCode}');
    if(response.statusCode ==200 || response.statusCode ==201){
      print(response.body);
      var data= jsonDecode(response.body);
      var categoryJson=data['categories'] as List;
      print('Category Count: ${categoryJson.length}');
      setState(() {
        categories =categoryJson.map((e) => Categories.fromJson(e)).toList();
      });
    }else{
      response.body;
    }
  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    CategotyData();
  }


  @override
  Widget build(BuildContext context) {

    List<Home> homes=[
      Home(
        deal: 'Summer Deal',
          image: 'assets/catogories images/pizza.png',
          Text: 'Pizza',
          texts: 'Fajita Lovers',
          textdes: '1 Small Pizza',
          delivery: '60 min',
          description: 'mix of flat bread or base topped with cheese, chillies,'
              ' onion, garlic sauce and juicy chunks of chicken.',

          tprice2: 'Rs. 600',
          tprice3: 'Rs. 400',

          likes:  '180 likes',
          rating: '4.4 (20000+)',

      ),
      Home(
          deal: 'Summer Deal',
          image: 'assets/catogories images/catogery_chinese.jpg',
          Text: 'Chinese',
          texts: 'Chiken Chowmein ',
          textdes: '(Regular Serving)',
          delivery: '20 min',
          description: 'Chow mein noodles, boneless chiken breast, oyster, sauce',
          tprice2: 'Rs. 250',
          tprice3: 'Rs. 140',

          likes:  '110 likes',
          rating: '4.0 (15000+)'
      ),
      Home(
          deal: 'Summer Deal',
          image: 'assets/catogories images/pizza.png',
          Text: 'Pizza',
          texts: 'Fajita Lovers',
          textdes: '1 Small Pizza',
          delivery: '60 min',
          description: 'mix of flat bread or base topped with cheese, chillies,'
              ' onion, garlic sauce and juicy chunks of chicken.',


          tprice2: 'Rs. 600',
          tprice3: 'Rs. 400',

          likes:  '120 likes',
          rating: '3.4 (2000+)'
      ),
      Home(
          deal: 'Summer Deal',
          image: 'assets/catogories images/catogery_burger.jpg',
          Text: 'Burger',
          texts: 'Zinger with cheese ',
          textdes: 'Single or Multiple ',
          delivery: '15 min',
          description: 'Contain Bun and filled with two chiken patties and cheese',


          tprice2: 'Rs. 1150',
          tprice3: 'Rs. 950',

          likes:  '80 likes',
          rating: '4.5 (25000+)'
       ),
      Home(
          deal: 'Summer Deal',
          image: 'assets/catogories images/catogery_breakFast.jpg',
          Text: 'BreakFast',
          texts: 'Omelette Bread',
          textdes: 'Serves 1',
          delivery: '60 min',
          description: 'Fried Eggs with different spice and three bread slice',


          tprice2: 'Rs. 300',
          tprice3: 'Rs. 250',

          likes:  '150 likes',
          rating: '4.4 (10000+)'
      ),
      Home(
        image: 'assets/popular/download.jpg',
        Text: 'Burger',
        deal: 'Summer Deal',
        textdes: 'Serve 1',
        texts: 'Zinger Burger',

        tprice2: 'Rs. 550.00',
        tprice3: 'Rs. 500.00',
        delivery: '40 min',
        description: 'Contain Bun and filled with two chiken patties and cheese',


        likes:  '180 likes',
        rating: '4.4 (20000+)',

      ),
      Home(
          image: 'assets/popular/popular_biryani.jpg',
          Text: 'Biryani',

          deal: 'Best Deal',
          texts: 'Chiken Biryani',
          textdes: 'Serve 2',
          tprice2: 'Rs. 250.00',
          tprice3: 'Rs. 200.00',
          delivery: '20 min',
          description: 'Contain Chikens piece with basmati rice',

          likes:  '110 likes',
          rating: '4.0 (15000+)'
      ),
      Home(
          image: 'assets/popular/popular_chiken_chowmein.jpg',
          Text: 'Chowmein',

          deal: 'Summer Deal',
          textdes: '1 Person',
          texts: 'Chiken Chowmein',
          tprice2: 'Rs. 250.00',
          tprice3: 'Rs. 140.00',
          delivery: '40 min',
          description: 'Chow mein noodles, boneless chiken breast, oyster, sauce',
          likes:  '120 likes',
          rating: '3.4 (2000+)'
      ),
      Home(
          image: 'assets/popular/popular_hot_pizza.jpg',
          Text: 'Pizza',

          deal: 'Summer Deal',
          texts: 'Chiekn Tikka Pizza',
          textdes: 'Smaal Pizza',
          tprice2: 'Rs. 650.00',
          tprice3: 'Rs. 450.00',
          delivery: '25 min',
          description: 'mix of flat bread or base topped with cheese, chillies,'
              ' onion, garlic sauce and juicy chunks of chicken.',

          likes:  '80 likes',
          rating: '4.5 (25000+)'
      ),

    ];

    return Column(
      children: [
        SizedBox(
          height: 190,
          //width: 400,
          // color: Colors.grey,
          child:
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homes.length,
            itemBuilder:(context, index) {
              Home home=homes[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                              home: home,
                          ),));
                },
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: 60,
                    width: 190,
                    decoration: BoxDecoration(

                      color: KWhitetColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                          color: GreyColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 3)
                      )],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          home.image,
                          height: 130,
                          width: 130,
                        ),
                        Text(
                          home.Text,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, ),
        ),

        const SizedBox(height: 10,),


        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            vertical:20,
            horizontal: 15,
          ),
          child: const Text(
            'Popular',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
        ),




         PopularCatogery(
           homes: homes,
         ),
      ],
    );
  }
}
