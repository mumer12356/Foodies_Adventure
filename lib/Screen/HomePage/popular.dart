

  import 'package:flutter/material.dart';

  import '../../components/constrain.dart';
  import '../../constructor/Home.dart';
  import '../Detail Page/detail_page.dart';

  class PopularCatogery extends StatefulWidget {
    final List<Home> homes;
    const PopularCatogery({super.key,
      required this.homes
    });

    @override
    State<PopularCatogery> createState() => _PopularCatogeryState();
  }

  class _PopularCatogeryState extends State<PopularCatogery> {
    @override
    Widget build(BuildContext context) {
      Size size=MediaQuery.sizeOf(context);
      List<Home> homes = widget.homes;


      return SizedBox(
        height: size.height * 0.5,
        //width: 400,
        // color: Colors.grey,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: homes.length - 5,
          itemBuilder:(context, index) {
            Home home=homes[index + 5];
            return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        home: home,

                      ),));
              },

              child: Padding(
                padding: const EdgeInsets.all(5.0),

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
                              offset: const Offset(0, 3)
                          )],
                          image: DecorationImage(
                            image: AssetImage(home.image),
                          fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            home.Text,
                            style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            home.delivery,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            );
          }, ),
      );
    }
  }
