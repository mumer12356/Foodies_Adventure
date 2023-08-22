import 'dart:convert';

import 'package:flutter/material.dart';

import '../../components/constrain.dart';
import 'Category_model.dart';
import 'package:http/http.dart'as http;

class Vip extends StatefulWidget {
  const Vip({super.key});

  @override
  State<Vip> createState() => _VipState();
}

class _VipState extends State<Vip> {
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
    return  Container(
      height: 190,
      //width: 400,
      // color: Colors.grey,
      child:
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder:(context, index) {
          Categories cat=categories[index];
          return GestureDetector(
            // onTap: (){
            //   Navigator.push(context,
            //       MaterialPageRoute(
            //         builder: (context) => DetailPage(
            //           home: homes[index],
            //         ),));
            // },
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
                      offset: Offset(0, 3)
                  )],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      cat.strCategoryThumb!,
                      height: 130,
                      width: 130,
                    ),
                    Text(
                      cat.strCategory!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          );
        }, ),
    );
  }
}
