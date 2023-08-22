import 'package:flutter/material.dart';

import '../components/constrain.dart';
import '../constructor/Home.dart';
import 'Order_Page.dart';

    class checkout extends StatefulWidget {
      final List<Home> cartItems;
      final double deliveryFee;
      final double subtotal;
      final List<int> quantities;
      final double totalPrice;

      final String muhala;
      final String houseNumber;
      final String StreetNumber;
      final String elaqa;
      final String floor;
      final String Name;




       const checkout({super.key,
         //required this.totalPrice,
         required this.cartItems,
         required this.deliveryFee,
         required this.subtotal,
         required this.quantities,

         required this.totalPrice,

         required this.muhala,
         required this.houseNumber,
         required this.elaqa,
         required this.floor,
         required this.StreetNumber,
         required this.Name,

         //required this.paymentMethod,

       });

      @override
      State<checkout> createState() => _checkoutState();
    }

    class _checkoutState extends State<checkout> {

      double subtotal = 0.0;
      double totalPrice = 0.0;
      bool isLoading=false;

      void NavigateToOrderPage(){
        List<Home> orderedItems = List<Home>.from(widget.cartItems);
        List<int> orderedQuantities = List<int>.from(widget.quantities);

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OrderDetail(
              totalPrice: widget.totalPrice,
              deliveryFee: widget.deliveryFee,
              cartItems: orderedItems,
              quantities: orderedQuantities,
            ),)
        );
      }



      @override
      Widget build(BuildContext context) {


        double subtotal = 0.0;
        for (int i = 0; i < widget.cartItems.length; i++) {
          Home item = widget.cartItems[i];
          //int quantity = _quantities[i];
          String priceString = item.tprice3.replaceAll('Rs. ', '').replaceAll(',', '');
          double itemPrice = double.tryParse(priceString) ?? 0.0;
          subtotal += itemPrice * widget.quantities[i];
        }

        // Calculate the total price
        double totalPrice = subtotal + widget.deliveryFee;


        return Scaffold(

          appBar: AppBar(
            backgroundColor: DeepPurpleColor,
            automaticallyImplyLeading: false,
            title: const Text('Checkout',style: TextStyle(
                fontSize: 20,),),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),


                const Text('Address Detail',style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.Name}',
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                            letterSpacing: 2
                        ),),

                        const SizedBox(height: 10,),
                        Text('${widget.houseNumber},${widget.StreetNumber},'
                            '${widget.elaqa},${widget.muhala},${widget.floor}',
                        style: const TextStyle(fontSize: 15,letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(height: 6,thickness: 2),

                const SizedBox(height: 30,),


                Row(
                  children: [
                    Image.asset('assets/pro_images/icons8-cash-100.png',height: 80,),
                    const Expanded(
                      child: Text('Pay Cash',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),

                    //SizedBox(width: size.width*0.25,),
                    Expanded(
                      flex: 0,
                        child: Text('Fee: Rs. ${widget.deliveryFee.toStringAsFixed(2)}')),

                    //SizedBox(width: 20,),
                    const Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Selected Items:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Column(
                  children: List.generate(widget.cartItems.length, (index) {
                    Home item = widget.cartItems[index];
                    int quantity = widget.quantities[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(item.image),
                          ),
                          title: Text(item.texts),
                          subtitle: Text('Quantity: $quantity'),
                          trailing: Text('${item.tprice3}'),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
                ),

                // ListView.builder(
                //     itemCount: widget.cartItems.length,
                //     itemBuilder: (context, index) {
                //       Home item = widget.cartItems[index];
                //       int quantity = widget.quantities[index];
                //       return Column(
                //         children: [
                //           ListTile(
                //             leading: CircleAvatar(
                //               backgroundImage: AssetImage(item.image),
                //             ),
                //             title: Text(item.texts),
                //             subtitle: Text('Quantity: $quantity'),
                //             trailing: Text('${item.tprice3}'),
                //           ),
                //           Divider(
                //             thickness: 2,
                //             color: Colors.grey,
                //           ),
                //         ],
                //       );
                //     },)

              ],
            ),
          ),

          bottomNavigationBar: SingleChildScrollView(
            child: Container(
              // height: size.height*0.16,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Total',style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      const Spacer(),
                      Text(' Rs. ${totalPrice.toStringAsFixed(2)}',style:
                      const TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text('Delivery Fee: Rs. ${widget.deliveryFee.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),

                  OutlinedButton(
                        onPressed: NavigateToOrderPage,

                      child: Text('Confirm Order',style: TextStyle(color: KBlackColor,
                      fontSize: 20),))
                ],
              ),
            ),
          ),

        );
      }
    }
