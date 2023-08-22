import 'dart:convert';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Screen/HomePage/HomePage.dart';
import '../../components/constrain.dart';
import 'food_model.dart';


class Privacy extends StatefulWidget{
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy>{
  List<Articles> articles=[];

  Future FoodData() async{
    // var uri=Uri.parse('https://newsapi.org/v2/everything?q=foodpanda&sortBy='
    //     'popularity&apiKey=82d33b84ce33465d8b9e8fb7f4319d07');


    var uri=Uri.parse('https://newsapi.org/v2/everything?q=food privacy&sortBy='
        'popularity&apiKey=82d33b84ce33465d8b9e8fb7f4319d07');
    print("URL : $uri");

    var response=await http.get(uri);
    print("Status Code : ${response.statusCode}");
    if(response.statusCode == 200 || response.statusCode == 201 ){
      print(response.body);
      var data=jsonDecode(response.body);
      var articleJsson= data['articles'] as List;
      print('Articles Count: ${articleJsson.length}');
      setState(() {
        articles=articleJsson.map((e) => Articles.fromJson(e)).toList();
      });
    }else{
      response.body;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FoodData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeepPurpleColor,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(),)
              );
            },
            child: const Icon(Icons.cancel_presentation,size: 30,)),
      ),
      body: ListView.builder(
        //itemCount: articles.length > 10 ? 5 : articles.length,
        itemCount: articles.length > 12 ? 12 : articles.length,
        itemBuilder: (context, index) {
            Articles article = articles[index];

            if (article.urlToImage != null) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(
                      article.urlToImage!,
                      height: 120,
                      // width: 120,
                    ),
                    const SizedBox(height: 5,),
                    Text(article.author!,style: const TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold
                    ),
                      textScaleFactor: 1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5,),
                    Text(article.title! ,style: const TextStyle(
                      fontSize: 15,
                    ),
                      textScaleFactor: 1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 20,),
                    Text(article.description! ,style: const TextStyle(
                      fontSize: 15,
                    ),
                      textScaleFactor: 1,
                      // maxLines: 15,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            } else {
              return Container(); // Return an empty container or a placeholder widget
            }
          },),
    );
  }
}
