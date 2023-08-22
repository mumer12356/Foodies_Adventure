  import 'dart:convert';

  import 'package:flutter/material.dart';

  import '../../components/constrain.dart';
  import 'SeaFood_model.dart';

  import 'package:http/http.dart'as http;

  class SeaFood extends StatefulWidget{
    SeaFood({super.key});

    @override
    State<SeaFood> createState() => _SeaFoodState();
  }
  class _SeaFoodState extends State<SeaFood>{
    List<Meals> meals=[];

    Future SeaFoodData() async{
      //var uri=Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
      var uri=Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=seafood');
      print('URL : $uri');
      var response = await http.get(uri);
      print('Status Code: ${response.statusCode}');
      if(response.statusCode ==200 || response.statusCode ==201){
        print(response.body);
        var data= jsonDecode(response.body);
        var categoryJson=data['meals'] as List;
        print('Category Count: ${categoryJson.length}');
        setState(() {
          meals =categoryJson.map((e) => Meals.fromJson(e)).toList();
        });
      }else{
        response.body;
      }
    }


    @override

    void initState() {
      // TODO: implement initState
      super.initState();
      SeaFoodData();
    }

    @override
    Widget build(BuildContext context){
      Size size=MediaQuery.sizeOf(context);

      return   Container(
        height: size.height * 0.5,
        //width: 400,
        // color: Colors.grey,
        child:
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: meals.length,
          itemBuilder:(context, index) {
            Meals cat=meals[index];
            return GestureDetector(
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: size.height * 0.35,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                          // color: KWhitetColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: GreyColor.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)
                            )],
                            image: DecorationImage(
                              image: NetworkImage(
                                cat.strMealThumb!
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              cat.strMeal!,
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            );
          }, ),
      );
    }
  }